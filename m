Return-Path: <linux-arm-msm+bounces-98366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCy4AJZxumnRWQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:34:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 570F82B91E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B317F309EE14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C6A3AEF3B;
	Wed, 18 Mar 2026 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U14DPW38";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIml7WUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707D3B0ADF
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826186; cv=none; b=eOHkfIszVoLQJSLjqg7ptJt5R3/YQ0xP68SUt7Oj+bU/G8M4lDMG/wx6LyPdy9cOqVr25BlAbFpozOs93LwW8mXHaNboVCaCKws2wBvWtsnJFNP/wivcob507TOAbhIkKOfueS1NK9aGRm6m92JB1tajj78Kyaf0diRuptw+d4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826186; c=relaxed/simple;
	bh=B0t5Z+fjK4dJNpn0yPA8+jL/EG+ANzr1Yese9qSdOp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKtQ+TTepmuixkB1URAnkHR1remueDSQxL2v9di2ymwcnxmH6cinRxsyo8D5bed+k5EMghwSnoy/Hl/iKCEhC0NrjeJMUnoSYEGPMyzqg+nF/SQ54c6FBXhPPLFWlTA1ifJwzKLcJ9HeJUbMxemsSVLz0hDi3iRxBUZjggHWZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U14DPW38; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIml7WUY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8mDaZ1145393
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcq6dUgwIcdFxzE+BZSA4BFJfvtn0+PADSHAnzt+B+w=; b=U14DPW38SQkZw5r1
	oiWV6NcclsHyV8iJc3eLguzUZYJSz+btkeelcvUfGFzsfwimNZ39D8nIuSX5aFtC
	VCVYgaGjP+C9y8AJlp4oevQR+HcEe8/LS4gsSXeMHDepnUlgGzaUqtoOX0YcE/by
	hy/DzT8eziRcrSPnoP4kngyyTZw53SxuK4SiyCB3fi4uGUXdXMOm/wG/muHz/UZj
	KgvjCGDRKn9QSdELPmBxwq5O6i6m+ZIG8NKdEyjqkuhClmmLUmPmg1Qp9c7I/qXR
	p0XfYbOzjFsY+LcQFg/gcTTb269VnHEwWiRnEFBWzvbOMpedbnA/xG5DO56c9feB
	xKXZ8g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3uk76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:29:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a01982dc5so60773006d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773826178; x=1774430978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcq6dUgwIcdFxzE+BZSA4BFJfvtn0+PADSHAnzt+B+w=;
        b=GIml7WUYCZbPmCCZGJilZueLq0vyg8sjJ7a+7gGhEKC7CiLt8I2O2bD6RV6EL+Q9zD
         FoQ31ZXib/tC06CoMwn2V8hzYNxBlpSQM6vHgILlO/75IUuQ89//qM4Jx+/kdp/xrEF/
         /gDcB16A5/so0pPnMh1L2RI1HKYkBobX4m/iGqTX+oA43ZH7HjKGz19RlEyt8zYv2VjB
         xqlkBEb9in1P5LdaBdTNPY2pjTtZPUFuRaujE2L2tuqBm4Cmsle/b5g2IcpbmYMQo77w
         IDtf8Xe6aUcvtLZMb05On56EtvHKIS5w+VI/bkcZxrCS//sszniw/5u0LC0imYzWrMHG
         Licw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826178; x=1774430978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcq6dUgwIcdFxzE+BZSA4BFJfvtn0+PADSHAnzt+B+w=;
        b=fUiiPHFXE6Ux15TbW8LFzA9F1NY0M1hObRCS+SAnGpjpCSLKSD0qYgqOQib3E8yu4G
         1OzuHgvZ8A2WBLuByOdufkqQEnCTtmKAbApQzwFNT8e4/mAUMrgyDQApz5ex25V49y6c
         qBTmomXbsYpSBGgoLIcqgIrBDz/au3vl2P9oqaiBETDt0XaYIof36vGhhUCxvin+9HGb
         /RwRF++sOkaE77kZIqnrWa5JDxxYWiWegoQ1AAz6nRYlnpC5omlecLEpNsTC3hbiHSft
         QD1NRE5iQgV5+ZZvov6lYtluXcTMEM1Np1A1KSEAFv0BeZFrW7a1vWe4l/AV06p6azSq
         K8hA==
X-Forwarded-Encrypted: i=1; AJvYcCVzvs++OWSA9bKMJjWDcqGFAl2giooY9n7YqL8FOxdzFxWHT8o0cUDnQAABvOs8iNgLcHajWjnH9XfsUhd2@vger.kernel.org
X-Gm-Message-State: AOJu0YxGUpOyyaZLjuppV42oWw+n98MyfMu8jFnpqHiVHUco5lgkAsyd
	0AzFdTUTFQjwumxwtM9pjJau763OSDRzlPXmAMJ5wOapgqOl1G4W9iUg29RofMOS4ZcbQg0ydbR
	+SaK3R9Z+6cG2rx6Q3tAaLYEotzpd8PcacTmBL5YkbhAimrgOvobbh7Fiz6IMHaBPPI2w
X-Gm-Gg: ATEYQzyDMdlmu44MtJk42ciuiuO3rbC0J3zdxiHzDpu7J1zrhycqNsg8t565sECxrin
	ME+2h4ZotBmNseHicY6SpSWV6TTyMkcEN0PFJ6OmzJRZaHF8cen2AHAqZ98H+Oo/i3pydXE6Zqb
	SnLSuoh5JFSQWw8t8MHNcofmy76IyKmSVppMZG5u7/OC5/vGEMlSevr/ifoTaQnGdZpqE/OeSSF
	1/fazQon/TDVwNKJ9tQNGLjJdguqQgRpz6TzxIiZ7dEmbmE/QpVyBjQTRaDrQOFPAOeHHs8CSV4
	mog0ZLUpqQb5b/0fWURPLiHJD0CqGGOfDJ74aWehLYy29Xjhjghx5hR/GlZF/PCN+0k5t+FECx7
	IDy1nmcSNo3i+ei4vsHZDkfmkw9O0OAcwX1Y3+ofTH0QipkkAxtjBqRob/D+6uhv6YeeEhXsCNN
	ADHsA=
X-Received: by 2002:ad4:5bc8:0:b0:89a:7d14:66d4 with SMTP id 6a1803df08f44-89c6b721eaamr28689506d6.7.1773826177934;
        Wed, 18 Mar 2026 02:29:37 -0700 (PDT)
X-Received: by 2002:ad4:5bc8:0:b0:89a:7d14:66d4 with SMTP id 6a1803df08f44-89c6b721eaamr28689306d6.7.1773826177439;
        Wed, 18 Mar 2026 02:29:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13ed066sm168825366b.4.2026.03.18.02.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:29:36 -0700 (PDT)
Message-ID: <6fa41a5d-ae11-471c-bc7b-3fd445a01b03@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:29:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/27] drm/msm/mdss: use new helper to set amsbc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-17-b7e8f800176a@oss.qualcomm.com>
 <19b36a86-12c7-4710-8f80-5e27c9c00e3c@oss.qualcomm.com>
 <uahvm7kvu2vi6o6mwznn5eqzqqscxmfetl4c3q3xa2eryg6ode@ltxfpjmqbrrt>
 <fe151ffe-aea2-429d-a725-4697381c4a93@oss.qualcomm.com>
 <hmamyk4lzo6ekswqvjlen6hc5stny2ucj5fxy5g2tvl3fqpbq2@ux7l4j4drm6z>
 <igwmdjbd43xdhab7vgqn2oaxh6yddbp5qe4zmh3xjyq7ix6hlo@itpftzhxkxtm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <igwmdjbd43xdhab7vgqn2oaxh6yddbp5qe4zmh3xjyq7ix6hlo@itpftzhxkxtm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba7083 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=li3VWkI-OtAmqmHzrUUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: xTMIbmmueOYVGdq2CyCOAa-6myEuEmNn
X-Proofpoint-ORIG-GUID: xTMIbmmueOYVGdq2CyCOAa-6myEuEmNn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3OSBTYWx0ZWRfX3pJ5C4a2bXoW
 qB4OqUSIKL+qBX70yJXSNm4C8Jp9jSIuB8ws8zWe1Q73GjfpT/iKyBfl5wgol+hSK0TChBja11c
 khJVP/lTQ0+w/MAZ9CRsFKpqaRHRpRySuS+cDGkicueg8vYCLcQpc/BfeCryDeCG65qHkifHx1A
 xmO+MErEaTzUKiv35W79HVEjXJXPu67NFj+4q0dphSM4prVEqfwxxfDqjF7WCvhqgdSuxXXBGvi
 5W5IAJ9bIOkdm4vomrodcRgTwh8qTqwWmO7CSWBIprH9nMwm108rHpkUkqfbhz32W2dj8+uNRo7
 4zJ95H9+p6QfdFU1EQNs+JwIaUTnm15z5yk3YcIe27ILU2R1Wy59c5Nr6IqPR7NUwr9mgJjilqN
 OVy9rOee4y0Y3menzRYr1oJfwx1LvLolPpfztZIkqDM7628G1S8vclFNk/zY5S+rVuOczjlQXlQ
 +igQL+dONHLjD+P4U7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98366-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 570F82B91E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 3:20 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 04:04:46PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Mar 16, 2026 at 11:08:00AM +0100, Konrad Dybcio wrote:
>>> On 3/13/26 3:26 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Mar 13, 2026 at 11:19:59AM +0100, Konrad Dybcio wrote:
>>>>> On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
>>>>>> Use freshly defined helper instead of checking the UBWC version
>>>>>> directly.
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>>>>>> index ca59bcdde7b2..04efc29f38cd 100644
>>>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>>>>> @@ -188,7 +188,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
>>>>>>  	if (qcom_ubwc_macrotile_mode(data))
>>>>>>  		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
>>>>>>  
>>>>>> -	if (data->ubwc_enc_version == UBWC_3_0)
>>>>>> +	if (qcom_ubwc_enable_amsbc(data))
>>>>>>  		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
>>>>>
>>>>> I know it's already there, but fwiw downstream doesn't seem to be
>>>>> concerned with toggling AMSBC in MDSS (perhaps incorrectly?)
>>>>
>>>> Downstream enables it only for the cases where encoder and decoder
>>>> use exactly UBWC 3.0. This is not completely correct as the bit doesn't
>>>> exist for MDSS 6.x+. For 5.x this is equivalent to the code from the
>>>> patch: enable AMSBC if targeting UBWC >= 3.0 (because MDSS 5.x don't
>>>> support UBWC 4.0 or higher).
>>>
>>> Right, this seems to indeed be the case
>>>
>>> While trying to confirm that, I noticed that some lower-end MDSS 5.x
>>> chips (like Talos) report UBWC3 in the register, but the MDSS docs say
>>> they're UBWC2 - any idea?
>>
>> I don't see a complete pixel format document for Talos, but my guess is
>> that one of the blocks (GPU, Venus or Camera) doesn't support UBWC 3.0
>> pixel formats. MDSS is just one piece of picture and unfortunately we
>> need to use format which is supported by all the blocks.
> 
> And after cross-checking the docs, it is really interesting. It really
> looks like for those chips we have used the older core for UBWC, but the
> registeres were not updated. One more reason not to trust those and to
> use the database instead.

Yeah, downstream seems to have passed:

qcom,sde-ubwc-version = <0x200>;

as well

Konrad

