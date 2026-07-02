Return-Path: <linux-arm-msm+bounces-115928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SlGbIwtDRmpnNAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:52:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 395696F63C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:52:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="LdJKowK/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C6xyaoF9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115928-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115928-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C11A834E865B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A753E47277E;
	Thu,  2 Jul 2026 10:12:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F04D3E1692
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:12:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987127; cv=none; b=AxUucE25mEG21SBsaPVTKkSsYSl7LnmqeXXcwu1VHzk/YoUaLN2OkO83rgopoIa9apRWA+dHzIYx4T0aTlc6XacKhC8TgKy+vGDxwpW/jW4JZs4OMW+ipth8F8nmWsbrvjAjbwCe4HLvQZqSrWkvN9Oq/wi8OXtR8SADeOOSR9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987127; c=relaxed/simple;
	bh=WPbU9zyN41Kz3ts39tgtUWXwby7aflswHhIE3AAgyTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+omnR+7PAIXv714GC3GqFTPIuNuLIkwSCnQd209MNIdD2ueBNk9Ql4KP5ee+GppI3cvgVa6rwvIEUcHLs3Twc6XXgajg4U8OYhMd0TruaigbAcueySsVmWOmaWVuqAfP16AOrtbj2tXG2FEy1DLT08bq/cG1TQa2LF5JTjAJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdJKowK/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6xyaoF9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628bHYj3009446
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W4rwTUsblVQUb2azkuxNIAxMmfdF2CA50hNgiVoaSw=; b=LdJKowK/UY8C+Tgp
	s3AfQxglZDGApN7sw5NlfvC8YAZZE/C58SrRlFq/0StdAGctnYD+hcAhXCL+v1Jh
	/fSHn6kTl/tynImwlqXCCUgBmTcTN5JHmgW5hNJDBmT1ElbUzSG6MPKmQ6eWJmL2
	egV8ddqzeqBpZfFvbZ91c7QvkBsAqHJaM25X7JGHWHRPmet6vdDaCrPzl/qo7jxs
	sfYOsNKsfD+oTvcRitul9tbDVb6zBoTyvcKehYjyX+8MsntIN16KiNvci0L/DJWS
	FSfcSbJTH2OS4uniCv4bEjbPhmpU4K0uDWd8DibMnha6Om7wi+mBx+NysW0HaJp7
	bqpQJg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579ruf4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:12:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8479c6c6cbeso1575752b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782987124; x=1783591924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/W4rwTUsblVQUb2azkuxNIAxMmfdF2CA50hNgiVoaSw=;
        b=C6xyaoF9S/q92mHdKhu8HYXUcJsP49nF6X2/FLwTrk9BuKfYTpQSoIRANu5NEEkFn5
         njdLO4NHC6rSAVdLpWTUCeUGEHlRRi0qTnw4b3ayMmOIzmDPFdUyFQtuB1mPT/pRkMJb
         M3xypQjjH2gYVsSQ8hnIzXjobv65tz2HV8K35mBkrtjthujlbAM6LhM0tiw3kWN34daU
         eVjgWQkCvh+l0ISY8EzzWPUvsQg37zZYwFOvztdRvVtvA45BMrl2vvALujingo+AWU/s
         Be9InDN2/nD6Y9wN2h3eXyOFKK50jZ5gTJrrI+y4t1ogCVVoWzJvH2GFfFv6JsT7JWds
         2L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987124; x=1783591924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/W4rwTUsblVQUb2azkuxNIAxMmfdF2CA50hNgiVoaSw=;
        b=SmRBGfJLQEyS/jr7CPhF/hXHQ/9XvJQw44t7Kfqic6PDlCPqx3ciqtVJlTXbkkPP/3
         y6CMI+hb9qaJa/J9Z8PSf1X21o4Hgr4O7Hn0Bc0hQZTtn8AnGSMMiAnwpDWpE5aeKCM9
         oeiwcFiUn4OG24zgXQWFzTMMp6DUXkPbBcmAIwJnQY28PQQjIaTVY3ReUdwfXuVylPo1
         AVeI59FfGSuL5/q9dieRdh8y7tJbKzQtJ3kQh+HdNrbYRKXCEpV1OtQTD7Ll5ulO4sD3
         RFkdwWK2all3x6iUyrffZdFhQEsWLABWQBCxMyj2vTvTbk3ajgqwtCWmbw/mN/Y/xtdR
         qq+w==
X-Forwarded-Encrypted: i=1; AFNElJ9EzVr4mPiKFTMaua595qoaOKmD98ADMmyRFWto0/LFDQDRANsmceslwbqINaibdN3dqzag8J8ZLLylRe5G@vger.kernel.org
X-Gm-Message-State: AOJu0YyMxXEcMGDL2rnM8A+uUuKz412WuDM06uVhI2Qs/0ee+w3DvRpE
	1I9zMq40VoJhiHhmZDJgcRFIUt7XutYQfVcv9ZMCBXOsbsIJuTwmSkvOjdmT1XtmLbPaW0CYFIj
	2KQbb4lN6RP6IIjL3YeC7ROHdtFKFBE1NHTkFwhCrljwPulx5r6nX41ZcHa6caeB/Iiri
X-Gm-Gg: AfdE7cnQCxDEEZvUBnTEsUoI1r0/L2nG5pxnuDqIsqmmOVzLmPqYYgtQrlpsYZKGCW6
	r/Fzg8zKoRJ6rd31dgtCCA+n7Vje2cbcGZG/N8lhWjgMpXpiOGJaSOkiz203l+2ApdkcQp8yfnM
	6q1Hz7FdQ60Fo0cePR6j8xpHX/1k4yuZ5ULUHg6FoVj0sGqSZfEEcNvBcxrrCYuIyDp1A6qJO6w
	DgeAvOpC+ucvMVs/HyBBta1XMBo9Ya3ziNnX8aF0L/l6sL8HdTZMlJESdDDBzGix0Gp6loihCOG
	gwgqlTzZ0Okre2qxTeNks9xrQ9yLgTYrsrntpm2FlhWD4qLclC5qkSvQ6eIZLM69qmoya0XVr5I
	uIhaa6R56klUztCZ4dwtPY2kZEgW27HhYZmP+dSXX
X-Received: by 2002:a05:6a00:1798:b0:845:df39:b15c with SMTP id d2e1a72fcca58-847c08956fbmr5292496b3a.37.1782987123942;
        Thu, 02 Jul 2026 03:12:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:1798:b0:845:df39:b15c with SMTP id d2e1a72fcca58-847c08956fbmr5292472b3a.37.1782987123492;
        Thu, 02 Jul 2026 03:12:03 -0700 (PDT)
Received: from [10.218.39.201] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9b409fsm1130752b3a.52.2026.07.02.03.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:12:03 -0700 (PDT)
Message-ID: <88770279-0c63-4c56-a727-dcebf03c32c5@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:41:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
 <8ba8a59c-fb80-45e3-b4b7-0db06614df49@oss.qualcomm.com>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <8ba8a59c-fb80-45e3-b4b7-0db06614df49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNSBTYWx0ZWRfXxIU7BuvI0VC3
 IrlnOkXr2/0yghDj6hrdfHxO5HKT9x7r31cEIYPOl00W/LnT7GL4xOHrX6of7rOZFE55cGvOlIz
 mH55P9XuUsG5yCKWQSletje04eJ3dtLo6dl0xZneEWj6X3yvedWHiqTQuyDHdl1pwl7fk3UJ1+S
 3Zg8iBEKEBSOU074H9OohWtho2tgIZ9BIuyUYdiKSMsCLxu3X4z7hF5CtZ3ht2r80KipGp154bp
 RRw2/6X5BDaP5DjI90Nv8Y0ZFkWnmzOn9UMax8vItHhWlvMnrVaiNzMHq8aD2WFHe45ryH5TK/u
 p4+Ywxe1+LDf5GE7f6ak57H1eJOgHTLovaXMUMeikakWcGAgVbQgdTNXxnHu7NbIJXiZSLYF4up
 WFrXO+8+e/vJwhr7T/GkUHOfIaSzUAW5COWS0BTJN3r8OwSiGyG9orMGE90ZyTunMCcgRtL8IYR
 XpGUS2lLXsO6kQKgfNQ==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a463975 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kG7O8nbCROFF2r-TvSsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 8481MXqYQKBlFob7DIdo7q8zCSWzC8TO
X-Proofpoint-ORIG-GUID: 8481MXqYQKBlFob7DIdo7q8zCSWzC8TO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNSBTYWx0ZWRfX2+Kjm4i7wFv/
 sNMdefj9XCSqLfFOjbXIhH/f1vBtyf0tihJHLyETS6MPLPHoRSeG9nAgvhz/Fb7+M57TAHhpQ4w
 CsOZoIzs7MLmX4505BsFLZKh79QUsPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115928-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:quic_mohamull@quicinc.com,m:quic_hbandi@quicinc.com,m:rahul.samana@oss.qualcomm.com,m:harshitha.reddy@oss.qualcomm.com,m:dishank.garg@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 395696F63C4



On 6/30/2026 5:03 PM, Konrad Dybcio wrote:
> On 5/29/26 8:02 PM, Yepuri Siddu wrote:
>> Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
>> industrial mezzanine board when populated with a QCC2072 Bluetooth
>> module.
>>
>> The overlay configures UART4 (gpio16-19) for Bluetooth communication
>> at up to 3.2 Mbps. Sleep pin states are defined for all four UART
>> lines to minimize power consumption when Bluetooth is inactive. Host
>> wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
>> SW_CTRL is mapped to gpio86 for power sequencing.
>>
>> Disable UART7 in the base industrial mezzanine overlay as it is
>> not used when the M.2 slot is populated.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> ---
> 
> This seems to be a single, unthreaded message. Please switch to
> using the b4 tool for submitting patches - https://b4.docs.kernel.org/

QCC2072 is an M.2 E-key chip. As M.2 Power Sequencing changes are being 
upstreamed, we will reupdate our existing patches to align with M.2 
power sequencing approach.
This includes aligning the bindings, DT and also BT driver changes.

Thanks,
Siddu

> 
> Konrad


