Return-Path: <linux-arm-msm+bounces-94784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPjMIS09pWm36gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 08:33:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C6D1D3F91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 08:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D5AB30387C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 07:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF1D383C87;
	Mon,  2 Mar 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vt7nhzNJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsyLSl2P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E9E377031
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436688; cv=none; b=ERlFre9vC0n5Tp2+m1K/7XN705mn+ThGwrekdl/u2Ge8ZolMiHGSJtI7vbsrHWFpV8j9ZXvcO1QS1vLrraMSPhUOWomTBDp84SskLQfDTvx6rqlg5vzRdRdknmf0k+WUGPndqrjTEzA21QG49QAwrRLgWLBC6rqy4CH/fW6eBpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436688; c=relaxed/simple;
	bh=O2VTGVdvg3lhFxxaKosfdcYYaZPGYCa8FpdgjEoOdeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTtALI15eUG6fcTDU6y9Uhg8Vk9GYWOhmZo16IjOJ/cIzwzOsSfYdo7Y4Y/KB/HWsA/f8o3ScrCrbNPUTFbdMFdJHFaJFqIKWNLRwBkR8VvI6OJjX26lELQWVnvkBuFzK6B+5GMAaeXjcRHgZ2GIGADSSyQro97FTlk2GgPmVNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vt7nhzNJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsyLSl2P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225YYZX1021251
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 07:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3nSpYdfjHnrXojouJgG/12wwvJoPG3PAC/dtHuCsgo=; b=Vt7nhzNJpJQQKVQ6
	ZGum+4xp8jEdoPcpTk7WkMuO40crJ/yFITKmiWOu/8b6BLVLfUJD/TRaxa03q3sF
	5+fNS/8e1jOtEkkQlMm5NVFf1w7Uc8K6sev+1rL5GJpMkivHbxLqlYKT8Ls++D0P
	gSagKPvww+aPkeCk/tkqShD3HUiO4Hy7O+PSeXH4TswHhNS5pX+p5Jj1dgwk9Bu8
	xIv64o14cBqsHUAl8R/1mu+7MAXQrc7GD64akcwQWd8LwPhhhuIsSN+ll/j9bVdG
	e87pbRd4MekDUBQ1Qqbl7yGP3AS1RVseTvMdHbpznorpFx6RI2xT0Rcb59ID6BCh
	/WZP8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrvjkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:31:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae49120e74so9867475ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 23:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772436685; x=1773041485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3nSpYdfjHnrXojouJgG/12wwvJoPG3PAC/dtHuCsgo=;
        b=CsyLSl2PoTYCY59QTrfTqxlYLGEBdTzs5zhUqkZUmp5Q0ZoahnbVRNT3u6vNNOaMx3
         QVRq2a4eROq7IVqEAuUDT2VBIAfNTytR9pt2w9YYqSrIwH6GJh8LrOcuUW03CTRvdrZN
         p/BmEqp4rXRZ9gKXL69KztkjmtdJrvtgN171rcL5DUa6G8Ec53hxUQiaFlPQWcka7oIm
         CbSid1Lm0hTKesAgiCpvNp4dLnSkmtgJSskGDXLqwb4gjpRa7/HTyfmoDFXj2mGfLXSk
         +xrgdtbewit4D8qHjyx0IObdma9pxY4d4b8QySnUAiUGQANpC431pjUh+MlE13f3Nq2W
         otDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772436685; x=1773041485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3nSpYdfjHnrXojouJgG/12wwvJoPG3PAC/dtHuCsgo=;
        b=XEX1ixd3kN1sY8x6AKc/D4vIWHMNGQHaqxnIl8DlBEo/vswc/0p5l7w0W6shSUm4Iz
         TZCyIAA6HmoOHS/bbIZlNXv/VrzQ33e3v4oE06OWDxc/8souAr6Vj+4IRO7kO0JwbabR
         CvFtOtw4hrNsjBeFgH5UTuDsENcbRKXGULQgcIB4xyiTeKVZewXkSNCYLxLaD8HONJSs
         kmMEShVeDVsX9MQMS4I2ijcOvmC5OQITgZ/9wphQuKVXRgVo8zkMcLI1n1xtx98EL64B
         gGsRkW7NlYhnoTv2z4Y/6UR+WGYPCCxGgpb9wGMhuAjmJapsbsGv830seH9OIExL8rUD
         gNug==
X-Forwarded-Encrypted: i=1; AJvYcCV+1A7gEjMhos4Dpguz7Oa2E/duOJZ41VOz4Uiw3dQzcz6VR8Zs0QfecUqRF0ADe+V5Rg+QgwZGCgx277AZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6AIZkQkaltLhuWoN+HTO5RY1a/SIjp6Nt/6A+HCPUdL3lbhiR
	lAWRyRgEjwM4yyL3D82vgCicprLsSK5XcPJL8WF5N+zVu/V4sbnb98GMtC1WB8fXeI/g9IjmNkb
	HiJbGdBu2I1otckawYBu0ntw0z7XlOaByRJ5DHeCFnwc8xKrS/ecJESMm0GwdxEHYONAd
X-Gm-Gg: ATEYQzxL3vu1wLKWUkyaaCmXYmBsg4ZwgZm0IH1KgTlPZIn2HfVR3HJgtq/442KTR3d
	LwDldMMI+LVu3OQbrQzN+ifBNBwIwGbYDi6jsP2ti/YFkF83I5irl4n4G4gI1+RhsGcS28b7xbU
	fyaP6j8vfqAahMvoC7caBksqK5UZHs3gXuFQco+2acpQOt/SW0WRHRQWIj7kmaX9zjgjB2r0/2+
	nD8CLeXURIqUTmkVN/RujReuPGll+ZQZMmgGsAW8TxxBRdLEUIAsal7YdnBOOXxHP/9Q2wuN7oF
	IJD4mUZsmM6S/Wtsb16tHvLQq4ckomlh221YRgDelDmAZ0vXJJrtceXps79TkWeJoxBL3qTVdCR
	320rZtJdRGCoJn0cCRRUNveWE1v5G0ZQWCdEoNBagP9YktM7IlN1VYg==
X-Received: by 2002:a17:902:f68d:b0:2a7:757b:35a1 with SMTP id d9443c01a7336-2ae2e4b2457mr136702665ad.38.1772436684602;
        Sun, 01 Mar 2026 23:31:24 -0800 (PST)
X-Received: by 2002:a17:902:f68d:b0:2a7:757b:35a1 with SMTP id d9443c01a7336-2ae2e4b2457mr136702165ad.38.1772436683906;
        Sun, 01 Mar 2026 23:31:23 -0800 (PST)
Received: from [192.168.0.172] ([49.205.253.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae399acba4sm66235775ad.67.2026.03.01.23.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 23:31:23 -0800 (PST)
Message-ID: <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:01:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: allow interlaced video streams
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
 <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA2NSBTYWx0ZWRfX8jiK3PiqD53W
 /0RYwUWpka4uBjqm0uX/T84zx0yh8JxvAqZSdWg+J8T5LpvlfG7hbxzAFajExrlae05br6nwrXv
 RmKG/LtKUvdw7b+L5hgNWxinYN2X+qwvTtn6bn/rAyb1YmkfL6Y/LlrVJNw27vwaQN+19FpvJ9M
 UCFN3afsX50ZVeG5FWS9evGiAi0rsqjMeSJy80gh47xgIAGPY5JkW+SRXTM6KV/9b2oIO8PSUwT
 PxVzuCopEyAwGggw+CLlDwiVaCt5/FgUsoDgN9/mE5juS11RQjs9UpSGt1FYDifYUAH+EnPwp4T
 qw25r6aaYGq8w69Cy+B/HLBf/8VvZSQGIc0nxHQJuYxkjwpqtl583rpbesPxVqAGwrY7XX/UFP+
 B7Qsknso1xLC3RwA1uv+t14NQr3py5PcN97QQU4ns/c0LPH1waMTu65TRzCwU9bURqWH7/W75Ej
 NvaZh1p82vBZ2sM9MeQ==
X-Proofpoint-GUID: KAKy-JQXq3eX0HMccivlpq9yxaHiC0kc
X-Proofpoint-ORIG-GUID: KAKy-JQXq3eX0HMccivlpq9yxaHiC0kc
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a53ccd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=WNU4mP0iZEZjDg176sUGxg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pgx13x3EImjs4AM0mqgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-94784-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[venus-mpeg2.md:url,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20C6D1D3F91
X-Rspamd-Action: no action


On 3/1/2026 4:05 AM, Dmitry Baryshkov wrote:
> On Sat, Feb 28, 2026 at 09:54:20PM +0100, Piotr Oniszczuk wrote:
>>
>>
>>> Wiadomość napisana przez Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> w dniu 28 lut 2026, o godz. 10:49:
>>>
>>> Venus driver errors out on the interlaced streams with the 'field isn't
>>> supported' error message, which e.g. prevents decoding of the MPEG2
>>> video streams. Don't error out if the buffer is set to contain
>>> interlaced data.
>>>
>>> Tested with the fluster enabled to handle MPEG2 through Gstreamer:
>>>
>>> ./fluster.py r -d GStreamer-MPEG2_VIDEO-V4L2-Gst1.0 -s -so venus-mpeg2.md -j 1
>>>
>>> GLOBAL SUMMARY
>>> |TOTALS|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
>>> |-|-|
>>> |TOTAL|30/52|
>>> |TOTAL TIME|75.526s|
>>> |-|-|
>>> |Profile|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
>>> |MAIN|26/32|
>>> |PROFILE_4_2_2|0/9|
>>> |SIMPLE|4/11|
>>> |-|-|
>>>
>>> Fixes: 059790467bf4 ("media: venus: helpers: handle correctly vbuf field")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> drivers/media/platform/qcom/venus/helpers.c | 5 -----
>>> 1 file changed, 5 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
>>> index 747c388fe25f..71e79093a4c7 100644
>>> --- a/drivers/media/platform/qcom/venus/helpers.c
>>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>>> @@ -1466,11 +1466,6 @@ int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb)
>>> if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
>>> if (vbuf->field == V4L2_FIELD_ANY)
>>> vbuf->field = V4L2_FIELD_NONE;
>>> - if (vbuf->field != V4L2_FIELD_NONE) {
>>> - dev_err(inst->core->dev, "%s field isn't supported\n",
>>> - __func__);
>>> - return -EINVAL;
>>> - }
>>> }
>>>
>>> if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>>>
>>> ---
>>> base-commit: 779cae956c8316aebc1946ef86ca001f99658270
>>> change-id: 20260228-venus-mpeg2-495f9187a1ec
>>>
>>> Best regards,
>>> -- 
>>> With best wishes
>>> Dmitry
>>>
>>>
>>
>>
>> Dmitry,
>> I applied this on 6.19.4 mainline and give run with interlaced content (hd tv) on qcs6490 (radxa dragon sbc).
>> Playback fails like this: https://gist.github.com/warpme/a368983678af0a76af85314808773076
>> pls see a bootom kernel output showing venus failure.
>> my sw stack plays ok on e.g rpi4 stateful v4l2m2m so i think root cause isn't in my userspace....
>> pls let me know if anything extra is required to fix venus decoder issue.
>> br
> 
> 
> Interesting. So, most likely, H.264 decoder can't cope with it and we
> need to allow non-NONE fields only for MPEG2. Let's see if Vikash will
> have any other ideas.
> 

Venus should already support h264 interlace.

Piotr, do you see the same failure without this patch ?

Regards,
Vikash

