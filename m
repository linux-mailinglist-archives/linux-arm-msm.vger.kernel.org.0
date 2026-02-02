Return-Path: <linux-arm-msm+bounces-91503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHehEwGagGnL/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:35:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E183ACC640
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2FAF530071C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 12:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931785733E;
	Mon,  2 Feb 2026 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VO1TO/qZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLoK/GUS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBBB1DFF0
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035710; cv=none; b=HCN/xFkUo8kX0csrPJBGUFyiJqIj3Tw6KttSViInl5F38Nti5Rleui1O52iJgTwdg67SJ45E08NCWcZZXfgoNZjZk4U+uYdZS8vuA7Q39lyzLcmVD9ITiZRh5QW7aSul3W3GREh1N0kzTwN3afuI47bTqVaJ1wbaFzFMRZOagbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035710; c=relaxed/simple;
	bh=ZUV+WpYJvy41qS+AsXlda1XtcYlHkozC7ARvIqjkdl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPAy7QYKho9WdnHF1kWZCQHltshwqNQOVxcQroVEUUrLTCRcST1hnn6LCF4CnYM0QAjhvME93/DuY/xYu8V7fjbbWnCkB64vuXL3OJ4kXs6xCZMnqA8PtWQmCcG3dt/ZMoySlApqWdvKud818D1lx0p6F2e3av7w3UposEd/lSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VO1TO/qZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLoK/GUS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B0UZM2900010
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 12:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RlfaiRErFz+38qG7agb/NlNLMwIwniX7TrkIR1vmws=; b=VO1TO/qZU6sJT/0T
	dDKZIt9nwE/gGhEPSPMoJ7FUszbDAdt/jB0TsUoYUe7hPaZJx1JjvNYVUZVJds0U
	IT6cD7InL6sf+9+Mk5s0xjox7BMOBE1Ddc32wyPj8AIM6SK6c8msFKtBwZ0Uk3Mx
	kk2zp0QhHBpkF/lwZR8KaqhLwx8CgYW9wQf1vRvN59xBGCXeY6mysfZOIXNfz9AY
	DHJGilo1puhAHIBv5QfpzKlb1pN+zSX58FPygwZiGACVyp92Tzun7TBNRD4rQJl8
	rRBGAgaucaUX4XZClFMM/WZ87TQahQPq+xEV/pNc41CfGupolekG0cDiWMKDDsv/
	RUmkgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0r8bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 12:35:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-505e8451617so2357761cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 04:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770035707; x=1770640507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+RlfaiRErFz+38qG7agb/NlNLMwIwniX7TrkIR1vmws=;
        b=CLoK/GUSlg/Ah0wtptrTSN2mPa1prLUN1HgO40LVEkdK4dVsavybU4IseSLoW4V0xm
         v7RStALHU4CQ3+uxbmhwaHfAJSyNKh9Y4uI8bmuuNRjd1DAr0MpH7iMIztzXE2pBqSaw
         ztGqnECR3pPTgA//yk9P7ladxKBmXCh0mSClU9iJ9V+NymtpUjrkGtIfWJyReb5HSybq
         dhB3HLGX4H0QJZqpwNqL7agkJJD/ciEcfJ1XYXz32946b66PLAjgSSsX09Ea6LOMVL/1
         KBmkCC6ZTEDJLHXo88sqDdg+1cpTRnHKUrxPnIb8omI74ReaAdyozLQwDVfLu7CdHdWJ
         qaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035707; x=1770640507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RlfaiRErFz+38qG7agb/NlNLMwIwniX7TrkIR1vmws=;
        b=Z40T5609Xs0mfuzDZefK261j2jIHlzhFjsAYytHyAVpXWgEngSGxuCUPVcGiDO83fz
         CEQ0Yizkbe/qUFWaqDJV+ZVA5Vt4iHbQ/+HzC8Sd7wMzL/GkuNgb0Zd6C35teRbfPE53
         i+QZ1HHm4TLICy+xafuUrC3fuTn6DM5Kdj5RY3cVTRCAH5eZOY/bSy6GXkeodTEB1Vis
         mLp9wYJjwC+oyVONCHWG68KEdNGeXravJ7YvslxI5CHP3OG3OhN9cjeHQDLC9e8AhCp6
         Kr7/8jJvK4KlXV/+/Qc2NNcHtaGs5fcKPmlB+OqUhmaiy4T+2qO8sODSHCyjOlGvHHNd
         xPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGoQUrhXuP66qSP9T+eGbbhZ57q60vstj90Xm3z5H+0FRDxav14S0Yh/yiJeh42RENoApohv2Q+nc+WAB8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3rnaz1vV/5Mb5ZQOA4WD9Bn2yY+HeHHw5RUsEebPCpk3yoxDp
	dlgRpqJzQ0dfVh2ZvZuopF5adc65qd/Joi2LhpQHQkC9p49xqK+aQST8zDDwUzY+6y/A92AV6/N
	kpIm2OGPDBVBY0OZh+E1ok0nJmQTFT7LbUBCQWz227DxDZXyjR3MeTGgHgXjUmFf/AIn8
X-Gm-Gg: AZuq6aKoEJX7V+g6v/tiTiY7pth0LIJodbSRdkJCACG8H4oEZfk7CNE1AFdBeNRSJAs
	abHtxC5f8am2uTMPCPagCxpV45F5WNkVgFLBcuAhHKUKhSdhSexPTH3xmiflXZdfaTthovK0cY9
	wsqzZhl+KC80QTFDW+O0ydymqMiJbhtWuPIP3Z803+WqK/CLv8HRBeNu8P5x5AnyCCf0NOPFTqY
	DTER2fm/U3GtqhcNeuShYlt74MBUjFdbDd2H1uJ7ni12BAM1O1RhCt2lCCzcdXwQiYFECgB3Eum
	Ys8DR4gtjrPLjvZesv6miHxP/rzBPC273s6eJ3KqXOPX8bdaKuoz285hbhhWvle+t+rDx9cyAi2
	jQSKST0mYhKKFOO8WXMhzi97XokVf65yoSvi2FqWQBej32DMA0zws9/34mySzimd2NbM=
X-Received: by 2002:a05:622a:15c2:b0:501:46db:6b3b with SMTP id d75a77b69052e-505d21a2a4cmr131162231cf.5.1770035707305;
        Mon, 02 Feb 2026 04:35:07 -0800 (PST)
X-Received: by 2002:a05:622a:15c2:b0:501:46db:6b3b with SMTP id d75a77b69052e-505d21a2a4cmr131161761cf.5.1770035706657;
        Mon, 02 Feb 2026 04:35:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0a2ddabasm3158660e87.25.2026.02.02.04.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:35:05 -0800 (PST)
Message-ID: <3d88b354-66a2-4125-a06d-752b052bf0ee@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 13:35:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
 <6lieos5uudkgynizozrmzrj5ov57frzzl65b2fpanwbhbmehot@z5uhyv4ipyet>
 <4632ad3a-c893-449a-b0d1-48d9c93da7e9@oss.qualcomm.com>
 <86dade1c-3ac4-4352-8dc8-e7acaaf21321@oss.qualcomm.com>
 <5a773b89-f3f8-486b-af01-3387c99e53e5@oss.qualcomm.com>
 <3b5685da-5178-46ec-b720-97e1ecd5310c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3b5685da-5178-46ec-b720-97e1ecd5310c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZGmNhHOy4Rzh30jLr5CPFqjoQCe3vztG
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=698099fb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QsawANE1_QW70S-DVw0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5OCBTYWx0ZWRfX7AQz3+A7Vtzw
 0FwWlm8PgP8Isk6G+QEQJapMOSylzkBR/sIUrAESm19hL3va+BDa8Y6cbGXEQyzxfMVL7VNnKx2
 Q5UH+WFCxTnUXzqLY+FUqAUWNceK5eR+cG/7IIMLpuNZnM/XqRHW3eYsQmXCHBavFmRgA4SavSk
 ornM7S5mzt/krQGa8mU4iIKZHXXoJAlGz/NKLUKori1+WCgCw/mItLctSRaG0X4V9lkW48pjFSy
 Q1X5X6/3sNx16LE295IH0F3fUey2KBj+cjc8i2wTRtWnhAWR92aJMESXOsBdnCrqMGDohpsXA2A
 Bo84DP1QYckazItf07NX18Z9BEocK57RWE+iNd2kpGz5l5FXwWfX/HtYtKFd+J2K++EtpebfvlM
 QQlRJfaCvlEhyMEPts8J0/Q1MW4xxMfvRIPQlE/wM6qwtKlrrBC2x/36vms7juRuE1JeLvHLkKK
 g6p2WgFrImy1LIOiR8A==
X-Proofpoint-GUID: ZGmNhHOy4Rzh30jLr5CPFqjoQCe3vztG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91503-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E183ACC640
X-Rspamd-Action: no action

On 1/31/26 1:11 AM, Wesley Cheng wrote:
> 
> 
> On 1/28/2026 1:53 AM, Konrad Dybcio wrote:
>> On 1/27/26 11:26 PM, Wesley Cheng wrote:
>>>
>>>
>>> On 1/27/2026 3:46 AM, Konrad Dybcio wrote:
>>>> On 1/27/26 12:41 PM, Abel Vesa wrote:
>>>>> On 26-01-13 14:13:32, Konrad Dybcio wrote:
>>>>>> On 1/13/26 1:33 PM, Abel Vesa wrote:
>>>>>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>>>>
>>>>>>> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
>>>>>>> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
>>>>>>> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
>>>>>>> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
>>>>>>>
>>>>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>>>> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +            snps,dis_u2_susphy_quirk;
>>>>>>> +            snps,dis_enblslpm_quirk;
>>>>>>> +            snps,dis_u3_susphy_quirk;
>>>>>>> +            snps,usb2-lpm-disable;
>>>>>>
>>>>>> Other SoCs have a list that's much longer, please consult Wesley if
>>>>>> this list is enough
>>>>>
>>>>> Checked with Wesley. He confirmed that this trimmed list is fine.
>>>>> He said he dropped the rest since they are related to the power saving
>>>>> features like USB2/3 LPM (l1 or u1/u2) and we don't seem need those.
>>>>
>>>> Is that to say that those erratas were fixed in this hardware?
>>>>
>>>> Low-power states of the link are no less than desired is possible..
>>>>
>>>
>>> I think it was misunderstood.  We should keep the same quirks as our previous targets to enable USB LPM support in certain cases.
>>>
>>> snps,hird-threshold = /bits/ 8 <0x0>;
>>> snps,usb2-gadget-lpm-disable;
>>> snps,dis-u1-entry-quirk;
>>> snps,dis-u2-entry-quirk;
>>> snps,is-utmi-l1-suspend;
>>> snps,usb3_lpm_capable;
>>> snps,has-lpm-erratum;
>>> tx-fifo-resize;
>>> snps,dis_u2_susphy_quirk;
>>> snps,dis_enblslpm_quirk;
>>> snps,usb2-lpm-disable;
>>>
>>> There are some questionable ones that I'm on the fence though, which we should consider removing:
>>> snps,usb2-lpm-disable
>>> snps,usb2-gadget-lpm-disable
>>>
>>> USB L1 support is routinely being verified on our devices (in host and device modes), so if its power over performance, we should consider removing the properties to disable USB L1.
>>
>> Does the fact that we allow L1 entry impact performance itself, or is
>> there some room for improvement in the drivers?
>>
> 
> Hi Konrad,
> 
> Its not exactly something USB drivers have control of, as USB L1 LPM is a feature handled within the controller.  The only reason why we might see some performance hit is if we have to frequently enter/exit L1 states, but if the link never make transitions into L1, then we obviously won't take a hit.
> 
>>
>>   (esp since we're defining the HIRD threshold as well...)
>>
>> Wouldn't HIRD threshold be related to *U*1(/2) though?
>> I see in the list above you decalred
>>
> 
> U1/U2 are USB3 LPM states, which utilize the BESL, not HIRD.
> 
>> snps,dis-u1-entry-quirk
>> snps,dis-u2-entry-quirk
>>
>> which forbid them
>>
> 
> These disable them for when we are in gadget/peripheral mode, but u1/u2 while in host mode is still enabled.  I'm not sure we are confident enough yet at this point to enable them (U1/U2) for device mode use cases.
> 
>> and the threshold is set to 0, so IIUC that means entry is only allowed
>> for devices that don't ""really"" suspend
>>
> 
> HIRD specifies the L1 exit latency that our device will require, and programming that to 0 will mean we'll require the minimum HIRD latency to exit L1.

Seems I had a lot of misconceptions, thanks!

Konrad

