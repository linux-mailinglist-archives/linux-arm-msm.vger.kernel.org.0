Return-Path: <linux-arm-msm+bounces-113857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +digDgxdNWpZuAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:15:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FDD6A69FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:15:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kdWn20E6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IFzXqcZ9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113857-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113857-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABF343024453
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4EB33985A;
	Fri, 19 Jun 2026 15:15:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643E33E345
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:15:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882120; cv=none; b=U2lO2CvO3IHdej59Dnm/FBRQiOoaePoNezsXCxI77FTYlN/N64NMUmoMbaNMLB4U2UExmOClAmxIZJRLmVNLjduF/tur12m0EPpjG90xh3RJBL1kC0hveld45Jk42ESSbVXPSI/MDsXm5P60Vy0wNCegVkw25/fHyfwF/VpYhe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882120; c=relaxed/simple;
	bh=/sLFkoQtI+WbaO+DA0v226vFfEE7WVVyAp/OcA12LRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m48KePGmCIWDDmlnmTGBgfoL28S5w0keur55qeljCP6d//Rz+jc9Pa/BJA8YIbfN0n1RallahOeRonkpvbt7nmDUBRD2TvNOEl40AeqKtyuJgUC+k3Org/Sy9mGmAlDqxiEZYp5WNU45YLeg04Ot5nKBkD5R7RXDC8K2RpVuBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdWn20E6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFzXqcZ9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9dNn3005565
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvm7EW1AZ3kby+gfRTDdQGVNrJ/dblRehYXBCDNmPIU=; b=kdWn20E6Dy7hTtX3
	eUjFJSoMcs9DrxAI+WrgPpm0ktgwPGhUYvgzCpllWZEX2gtSyEHFYhjsKRq6yNaD
	WyEiDBE2KUgtXhOrVqywTMAkNaPa2N8JQBKsI9mfAGf8I9H/ba4Eu/cXQVB/0qdx
	dkj8vW4XXKCZI3smkEY6l02Lhn7CX9KR4bZs/dWSgKAQ6nvkkN+Sr2JhTyH4/AzH
	x0OF5GsS9De8HEyeQZM6u9CzWD/cJYMpDTQtNtm1RWXfjCUyxpaUknp2qdPltjSs
	8N+B6CPN3Qm6Lxrnj9O1CWG+mZAflcN1ZeydwaSHVrbXa1uc6+iVszuyIvZKdSb9
	1CbZuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyrc176-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:15:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-920f826bcb4so13873685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781882117; x=1782486917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvm7EW1AZ3kby+gfRTDdQGVNrJ/dblRehYXBCDNmPIU=;
        b=IFzXqcZ959hhXiy1ZOpdnJfLRTHg57zIqyhVp1ERRXKcv9e4azaq7m/AMrNp2qglOL
         s/ogXDiZzRUJZ2ds47hYNWc5pRVoXVpO4mCjbEwoMQ7JYSCSNdQyRvHTsU7jJvEkAJzD
         v2BhHhy1nm7SB9i5nbHvFreKkKitSpaql3z0MMavS4zQuHZqe7dwhlZ7uc8BhLfy3Ra9
         JOuH+kSiJiCFbnK+zmkHInnCheK6xn9phQ2SxXEYDrhmIKWvpXKwsFc5VAidl1+ajdcS
         AS6BzAgn6vetcmxbdRGSAsDIPH9UB7eWM4OvvPUNXELjgXcBei9T1V4OKJGO8za3Yhef
         KvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781882117; x=1782486917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvm7EW1AZ3kby+gfRTDdQGVNrJ/dblRehYXBCDNmPIU=;
        b=KkgHGwnKZb/fNV9AyvLdCnyggx04/acqQV6iKzybd4HOsE1sQOK0ICrAq2laqBBAHQ
         VR+m91vFdsAeqWNupYNqmjaswq2h+HKJ1hOVgKvBhRI7Sn6+zaG+gcygbPcfhJFxAwJn
         cSd9tB8MqmFwLMt1XUTVs8asU0J3GTfHWczWKDEXSSWYNMO+3pFPmGVDDTLrcXSgkdQD
         6Y9wvdkE0Zxp753sZIvGaR/H9f6A7Oi3UuvdcCqpx+SWqrrzPTlIQGBku5YYd+vEZ7Ef
         iaHtJb/aUv68JmYGD4TNb9VoEwAe1K733KCef5UaovbFU3GuiUn1SioABIWLj0+NRrQi
         gLjA==
X-Forwarded-Encrypted: i=1; AFNElJ/Y4fy8DzZzn/n7CUFrD48MZMkDTjySVe7Rcrvp/SyWA4C5oWQefWfl/O3y7m+1BrF+SNcpW4M3pUyyt7jr@vger.kernel.org
X-Gm-Message-State: AOJu0YxZolhaIk+Vz2tbRukpM365wn546cawQqkYeExSjjZDWN/8Xal+
	k07VTaDpFNe+cXm9bIVamyMjgXR+AMdiVWB7TRg+1Wn6zPpx6hsS/9n64IVTl5LsQH1aE+37/26
	QIFa14N9+0WpIN6NWiZ5hbKUgb2BtpHYXiA4N5DPDr4Bimi30VD+1Yjf5XF8wHO/ecyXr
X-Gm-Gg: AfdE7cmew/vbB5Xs06ajGChvIv5yzjDMRRVn0eNjyP2GB3E+4M1iUa2cDjGwc/ogcZf
	nZkwiTEptg1XSoWjPkN0JovXCcpP94Ap4oj94Q6+DgLmZqgZ60OWQx7LUodJHQzaQRlTvncQPrb
	2JLWFBHhji/gA2skw2AayTSYonn7/2p9Rrw3h2YWzdCU8WFBAmRfcum6YZDfy2nMFcz+rFRI0Kv
	aakARX7DIthzT9zmwRFi9BRkyaHtGb/WRmqk3fEjyKzXqAy3OI11UVBZLGXOEwM0q/SQ8TNaMEf
	1BkKzf0GcDwPIyao+PDPadjY97GXKwoSZ5EsJEngf71tXwhnK3DUwSkGJRb6LDbp8oje7Zmi3I4
	njoe/5WGWWw4CaODNOQQ6IIrCim8ptWCNiqg=
X-Received: by 2002:a05:620a:470f:b0:920:6579:bee8 with SMTP id af79cd13be357-9208b292196mr366922385a.1.1781882117245;
        Fri, 19 Jun 2026 08:15:17 -0700 (PDT)
X-Received: by 2002:a05:620a:470f:b0:920:6579:bee8 with SMTP id af79cd13be357-9208b292196mr366911785a.1.1781882116580;
        Fri, 19 Jun 2026 08:15:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a844f855fsm96816066b.4.2026.06.19.08.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:15:15 -0700 (PDT)
Message-ID: <a0e7c439-e377-4607-9468-d7c1681ded4d@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:15:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: Add thermal mitigation
 support
To: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Umang Chheda <quic_uchheda@quicinc.com>
References: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
 <20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com>
 <d99447c8-f140-4ac1-85e1-a235c37eecde@oss.qualcomm.com>
 <CAB8MRjTAbpwcrD==eZuaJdaprQoEsgr2L1EEU6x+gEu8tAVijQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAB8MRjTAbpwcrD==eZuaJdaprQoEsgr2L1EEU6x+gEu8tAVijQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a355d06 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2tevii4blPheqIWeYmQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qtKfxVgqGefEHpQnXkwqqH20lswLD5bk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfXyOwcHGgsQ6ho
 q0mumNf9mS++7Eh8yfTc17ML0c6q+IJ1OESRsr3N/HRrWBhye/BizQXLYfC2bYyITLZtg0dIz96
 cKdwwCWlPIVyAyo1jLYSYSLKFunLFEyR35vEeiK4m+G7E+p8lBPbKRXpEwbE/wjB2Ufps5/A7H8
 lJIXXCVCXp331eELGVFVHPS6om4351jf9sfLYsyE289atQzWX2YG3bdtsDNmoi3i4JSGwAfebmq
 KDRzWUmYWIRHMfdjG8XrXo57nwNqQRUpBzGB9u38KRbbRbERWAgEfvSApHie4TIgnokUZoYRSi3
 0FNCuAPQd+sedSjH8YWU1TGTipWPWKmqcKYEHM1f4Nlw1OE4DsBWdeB4W67BO3T98o8Mby2+bG0
 HaV9hCohiwabDHWxHfmePY0DnyCcO3w5In0WXSHFtrQv91ETRjHs4hopm7MSeg414GPqCJGMvwV
 roEglK/pyuYPFqd3Dbg==
X-Proofpoint-GUID: qtKfxVgqGefEHpQnXkwqqH20lswLD5bk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfXzFsW2QmXEyKR
 Lw97qF2a387CKnh8TLXUX3SCGcBufZVMBLc9mOd7UT3tOgDhePcP97XmvzsXqzCTRZdDN6fHpI4
 mlG4PxXSUu8PBChe85zJxIww6zjo8EU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113857-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dhruvin.rajpura@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:drajpura@qti.qualcomm.com,m:quic_subbaram@quicinc.com,m:quic_uchheda@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1FDD6A69FB

On 6/11/26 1:32 PM, Dhruvin Rajpura wrote:
> On Tue, Jun 9, 2026 at 3:12 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> wrote:
> 
>> On 6/9/26 11:16 AM, DhruvinRajpura wrote:
>>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

[...]

>>> +static int qcom_battmgr_parse_dt(struct qcom_battmgr *battmgr)
>>> +{
>>> +     struct device_node *node = battmgr->dev->of_node;
>>> +     int len, ret;
>>> +
>>> +     ret = of_property_count_elems_of_size(node,
>> "qcom,thermal-mitigation", sizeof(u32));
>>> +     if (ret == -EINVAL)
>>> +             return 0;               /* property not defined, thermal
>> mitigation disabled */
>>> +     if (ret <= 0)
>>> +             return ret;              /* real error, propagate */
>>
>> Does battmgr really expect the OS to house this information? Can we not
>> retrieve it from the running firmware?
>>
> 
> The firmware exposes only a single maximum FCC value via
> BATT_CHG_CTRL_LIM_MAX, not a set of discrete throttle levels.
> The thermal mitigation levels represent a platform policy
> decision - how aggressively to throttle charging at each
> thermal state - which varies per platform based on thermal
> design, battery capacity and use case requirements.
> 
> That said, if the preference is to avoid DT for this and instead
> derive levels programmatically from the firmware maximum, we
> could generate N evenly spaced levels between 0 and
> BATT_CHG_CTRL_LIM_MAX. However this would reduce platform
> flexibility. Happy to discuss the preferred approach.

Following up on what Krzysztof brought up in the other branch of this
thread, does battmgr only allow to throttle the charging current, or
are there toggles for e.g. power too?

And does the reported max limit current adapt to the selected PD voltage
level? (I would assume that's a stupid question, but never hurts to
confirm..)

Konrad

