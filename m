Return-Path: <linux-arm-msm+bounces-98175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI/uNqpauWnYAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:44:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5679B2AB249
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41549300B57B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C30B2C0F6F;
	Tue, 17 Mar 2026 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzrliR7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chPpQy7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB75298CD7
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754801; cv=none; b=OYE1PUOC2drrymITaYdtL0BrVdwra7HCAuVLZR4vBZFcpFBuEvl7P8Qk8iaISNLTsoTScRjRI5QEVCzk1r0ZBFNCJj2rRRwDxMXUAChS8DgqJGzYM4hsP1Th3L/avaAhoZFtNT3Z0Zg4MIKZcfw5rDRpXma6+sZ6BF77sY2Xp70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754801; c=relaxed/simple;
	bh=HunAAgOjoR0JoAyZG9x2HT69RJ/eMoGtrBbZjFlQxe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJ1Ky/QF6b9mooXqMq8Vib9CXuUA4ksgtW1ywxD4N37HOd1OmwZpOddkxgsS4uqspK3YK0V5xkYlCMe2r4yIxJ6/4PmNGDvelIJHaf8q4Q2BMxKkb+VDyFjnhmlsHpFvOHTzIBte/06wKlLJdffHCCisoeVF14uWGlYcvaxAzhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzrliR7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chPpQy7m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H9PuqC3102089
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 13:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFRMtnZO+13TGvwOg+Z9PNle62EKUwsSYqYDGn5wI1o=; b=VzrliR7zwuWp9n1M
	A22ho/vsmj7IesWHmwG425vIZCcr/FcSlSGb11HXfdUOAufL++f14Ta7Ebp3FVph
	Jcy3Fs+1iCumiRFDd2Pdr6Fb2DXar0cNXQNpBikAfg0WnSJMO5m7TKvv0qEajBzr
	BHEsn0bAdM9Nl8ONOVGD3/p7SW7DIvMxzt+QPlob3meOx0HV9gDXWeO1tHTWH6MI
	czEsmmrMHdyGxyFn+KOZTBfwAGrNkpd/Hlkt5bauKdb+4pFSlRexk+RV+Xjfva1e
	w5qX4m/+PWVjCH2x2stopJGv0W9PDk+GD2Yu034OVOSeeF4iblwrzHT+H7qmYghe
	Mdorew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7byus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 13:39:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd827a356aso443329085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773754798; x=1774359598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFRMtnZO+13TGvwOg+Z9PNle62EKUwsSYqYDGn5wI1o=;
        b=chPpQy7mqPX3GtJUQ8bF15ok0SC6hrFsr/Gf6TPxsWQGCBEqE982h7air0wyhn7iTh
         w048kdDQqSwei2joLOAxg+bCz+R8bvCdd6T8/1cLPJ2R2XVrudwFQRxAKe/HJj79VYQX
         e6YPn3zGcqdfTRW8bNOcjQcZNQrl5Hl8/K1RQew5pXK4aCL3V/9k+Lh1pGSMU29q6A6x
         1F+GN1koYak0254NoQxljPkXLtmHexnh5qRJ4G2vWYUI0LmcVd8hQAWFVvPl+M3LqwIC
         wmV+S7YkXzQ77+8waUi6AS5k7ZxI0h8eFlUsJCQh5hogq5NENFV4XHRiif8nvA0wkbjx
         KbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754798; x=1774359598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFRMtnZO+13TGvwOg+Z9PNle62EKUwsSYqYDGn5wI1o=;
        b=CP29KuwGM+dQvqEgZjlYUrkTMEYSYlt5TrMGOq4vscjUz58VWbuzy1kxR1NUPCBmHo
         njwBR4xq6pRIdI0VHe2rnqpLVa7TlZ8uzBQPBJ2D4q0MRdg7L378Qt+2gKXO4+4vZL55
         v4AWDkdjaJe8Vduyl1DKHo2gT7A7nZmV+cmnyCVjwMMCKM6RSPPT5UOywvV1Hy1UcEhL
         Wp4RLxAPFK6JQsT1JR8VnHCPcCLG2S3q/G5ie/YQViJU88fpQON+UFya9cK7ieDq5HMy
         zErM065hUxVVoWYo0bhYKYny8lwUDxsMzCiAiT5OzbCcFsGPZ+tyobrGz/wOsEVjDo1u
         vPtg==
X-Forwarded-Encrypted: i=1; AJvYcCV/Kv/qVsBIRNKlO9lFBpE2dB+hjWxArwMbCrP1lKiA/RKia9UFm8GAED4m7xcakjbkuBkB0dFuOhrsaa5t@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+5vK8VEmcbQ3E3bMNUgjlm78sjF8QgpLCbVhq7ixeoxHeed83
	CO2C1vXW/T1ZLCo88cjHm+3/TH1SWL0Ib7TaUbzrZesuEWPRPeQA0O0aO0HpqhFmUzf+YizH+t7
	deaMn7M+Ggh/AgWJAmf9Z/T9ISnggm1/hW09IVk2ScsLrA/sUxhNoUEUTiVyN+0+UMkZ3
X-Gm-Gg: ATEYQzzR01lXqRZ01tc+POVkTEkTaaIGADpI+idt4pnLhlOBK+xGJQ8e32E6GLE1vIw
	0xtpLeRFvP56N7Z2+WZw+ytz4AIk8i9PgvdUD5JIb0gc9tmywM2eVgcEalsZRf9R8aKqfyvKXEO
	uGIfJcFDDuH5e6KHovJF4uoU7xEZ6lrTs5LE0z89peO0SC0eDYLcMbTeBdeojSe4A7eA/NPfrh3
	cT6aYNrliG/34QH3YF1mw8XZ2k+pZ/MMmrBRoD7rNbM3VQNIHeKMyHmoFH9rcGXk4QILEeLvU2K
	uuGcT1OrkK/yspLeS4dHcn8PQm3NzrpFWn6VT5ptEXrxp7+CmdCEU3qd8hS3rfrH1cyEJZ78Tod
	vXzHnSAROD7FKSljraVRkNqn88wpSyiphFdq5yHiJVCYqI7YBORNfVJvtd2C6PITg7rFuGHPwri
	oMYhACIgsp
X-Received: by 2002:a05:620a:29d5:b0:8cd:982d:4101 with SMTP id af79cd13be357-8cdb5a6073dmr2130364085a.27.1773754798131;
        Tue, 17 Mar 2026 06:39:58 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:8cd:982d:4101 with SMTP id af79cd13be357-8cdb5a6073dmr2130358985a.27.1773754797576;
        Tue, 17 Mar 2026 06:39:57 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:67fb:53f6:20ba:ff45? ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855777bd37sm189801525e9.3.2026.03.17.06.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 06:39:56 -0700 (PDT)
Message-ID: <890bc81d-6bff-4e2c-8514-c22c52ddf767@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:39:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 3/4] iio: adc: Add support for QCOM PMIC5 Gen3 ADC
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, lumag@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        daniel.lezcano@linaro.org, sboyd@kernel.org, amitk@kernel.org,
        thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org,
        subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, rui.zhang@intel.com,
        lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com,
        neil.armstrong@linaro.org, stephan.gerhold@linaro.org,
        Jonathan Cameron <jic23@kernel.org>
References: <20260130115421.2197892-1-jishnu.prakash@oss.qualcomm.com>
 <20260130115421.2197892-4-jishnu.prakash@oss.qualcomm.com>
 <20260131173941.68b8116d@jic23-huawei>
 <6012ad64-3a10-4f05-9f37-f2d0c36df582@oss.qualcomm.com>
 <20260207165638.0ed27302@jic23-huawei>
 <70b77d54-a6ab-426e-a7e1-3e011adad6d4@oss.qualcomm.com>
 <20260223203145.4a4493a7@jic23-huawei>
 <cb11a2d5-fc4a-4956-91b8-95bcf9e7d7d5@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <cb11a2d5-fc4a-4956-91b8-95bcf9e7d7d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyMCBTYWx0ZWRfX3SgASHsxMVol
 Imvy0xBVe3UM0UdluJ9PeEpNRs/PtgDYPs0QzuZXUf4rYyxFk62hA0kbw7DvcKaHpvjTCX1rvDC
 jjdD+ufFePb8dA2Ul+qqf/qkBql4IL5lxVAB+Tqni8+hQLLrOv6G2dXUTie0t8RXmJ9zpTHm0WW
 XyyezON5x6NM+S3zTeuNKXy5pdJqM72wiYmDIL8uDflD4MmsUszK4GkGJBBK+zkS1m/Gbcmj48I
 hnwMCeR873+seMiDKwgUJMdbcQ4yemOMe8RXO9YDUbkDIsv74ZSJMuxOwWNaP5Qh2f/rVYcl3kF
 9HE7Vgt0ALxT0zx2FdYaygzBc63WgRzuqA4O0L9SDVBKihNeG/hQdk9CT66et9OlvVnG+749Be6
 wbq0fUe0tcWH7Ovccom+VkR1k6SE2LP75pnAYtgCOXGgBUMToYywSrbAsQ8SLkzo6Ex2I3CsM0b
 Vq7f27EFGdCwzb+ycuA==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b959af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=0Zxp68U4Wu1vdwFdiBAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Hv9UZB8FR5P3-8YmfE3kaQQo1lIu7MzY
X-Proofpoint-GUID: Hv9UZB8FR5P3-8YmfE3kaQQo1lIu7MzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linaro.org,gmail.com,intel.com,arm.com,vger.kernel.org,chromium.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-98175-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5679B2AB249
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 14:33, Jishnu Prakash wrote:
> Hi Daniel,

[ ... ]

>> Sure.  Immutable branch created. However, I'd suggest the thermal folk don't
>> pick this up until it's had a little soak time. Today I've pushed it out for
>> 0-day to have a look (as part of the testing branch of iio.git). Once those
>> results come in I'll push it out as togreg and linux-next will pick it up.
>>
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/log/?h=ib-iio-thermal-qcom-pmic5
>> https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git  ib-iio-thermal-qcom-pmic5
>>
> 
> Jonathan has picked patches 1-3 of this series in an immutable branch and I see
> they are also present in linux-next now. Is it possible for you to pick
> patch 4 into the thermal tree?


Yes, sure. Let me have a look before

Thanks

   -- Daniel

