Return-Path: <linux-arm-msm+bounces-107404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HfBKdS5BGplNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:50:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF65384EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F7CE3128D56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7994DBD87;
	Wed, 13 May 2026 17:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JR1l6toh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zsw5x0Pj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5CA4DBD70
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693617; cv=none; b=XJfkGrTg5u6uDlZ2J+wYzTHidElV6jpcPSQXO2PJ2JGff+UUNV/uL5LtD6+darqzpiFuhE4pAUQ84sm8ZR4neQ6Jj4kL4y34f7ZXUUXBchhPvWnV/PPTVZ3Y8XN5MCCV6o5ygfFbJP4imD3tdfEna9WBGVmwB3Gu1+NlUrlhfwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693617; c=relaxed/simple;
	bh=xG/r1Vt34Fqck50/pkf+OoS3t+GkdRdjeVfSG9XFxL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hks9+R3Wb2SGUu5Si5z9bEJG8YEWsGT8HF9KXyIarHPSiqdpXHsazTz6+sypb2l/z2W7AoXYaLBXm8WPMjFjtQlIF42WqWb+GlMK5BBThXbS+j2lVbYhrh2imtQXCtnTt6EcWfdxEqDYUX1eeQPJ6KGAyyf13x6jXwYsx//1GB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JR1l6toh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zsw5x0Pj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAvQV2524346
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xLugS1pkT2WpiOojxykqFPTYYN8a0gsAdOuFloLqpI=; b=JR1l6tohwdh3b4BQ
	WmQ+U4+0Q8SJ+t5rVkkRJIZWF5x6UGv2ra4PhnBAixGtm8EmgXJaPV9/dylVR2Gh
	SdlZbWh6uUSWn2cCKvpVd59OPwNyd5btqlkV6xVLMylpOg3s0oBRCKKzyzqvlhJO
	ajOI8MkHwQ1NWarSzqwEsRChuIUMIPANubdTo+m5r8+4JGFQXoXSUdQ1JSEsyiVE
	uNsczWkwjkiq9snbn+QYBP6e0kNCpOpK4N3tSzzJbO7yYEPqINntnrlTyrlhLVWD
	0DpXONq+x7Tm04Lfnun9xnkCT2A39PuG9THI3p75oKL3fzM8V7ZSdgWMkRGtHdrC
	vA1A2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjgb8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:33:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so6701417a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778693614; x=1779298414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xLugS1pkT2WpiOojxykqFPTYYN8a0gsAdOuFloLqpI=;
        b=Zsw5x0Pj2oIgEjqmtPjMm2lyHw54Lx+m09cR8UJjEeuhgX6McH0x3n7uMxaZbcX6O9
         ELTIgbxeT1FyPMWGPuBJ4WihQwPBOlNuvMlqRTddJWLQa9zZWk+gdNuPP+eedjq/dKZV
         DnIsfIo7COfe6UKv5aTm5F232UwM8hPWzi1UeL/pgjI7tHYKO9+IqEraiGeljV3nSW4k
         XCPpcsFImtVvvjmgpaR71/Vwq9rqqd1ByofeVrAFhyn8gshAW0hREn01bztqXXSwIU9I
         sTUW5HT+sROqoXenb6zOA9IYy7j45IG9OdU79KmgKaFo2RoeHExaLmonfVbhdGp9gCIo
         av0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693614; x=1779298414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xLugS1pkT2WpiOojxykqFPTYYN8a0gsAdOuFloLqpI=;
        b=bZEnTLmY2T7kPJD6YSUU3zEaa+18Ks7fznaQCY2dQzvxwpLuVHnpXOy8zk5cPX7znP
         Zc0LwIHfDU1Ss8JfuolSXPFvA8v9BFHNG68HhwruiqMEjcFqGsCf5m/IH5ck5bLxgb5V
         Ig5xbEVLt46TJGo+UA8FpvEM2emaQiOZCILDfTt2vOGCOET6JkquD5OrEmS3PXZevPeR
         IKWzYFv0r55cVekH/YcRTrWFwiguujuP675ceYvzawfY1FuPG0OyivzH13TzmiQbK/K5
         +6+DYhXplZplrym5dHnPkRu8b6wUYVmnb26fjOs/IqqjtpMe9HeyNFAVAVov4hW8Qwow
         dY5w==
X-Forwarded-Encrypted: i=1; AFNElJ+vbyHQihPS7AsXcsGRSMn+K1TxCBXqCKA8tj0i4ZgJthIuMfDOwKH+RQhuSb0fgjuognXHTPzdXqNuHxjp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5QY/avnEOfzdJkyfWj6v4OVWv3kyzAAjz0E4o5XGj73nfMOc
	QKqAICGOUFVq17gv2vATXh+K2C8XI/QGVWe5wjy0zpBNPfVERWCR3ZcMqNFEEWMc/GXwxz5Tobu
	E8D1IVFZ/qwjITIbPjz9dsGtQ5ZDL4mpfMGbogKSi521ocgX+9CmheNEBHz6SB+lHfuUDnabf6r
	p0
X-Gm-Gg: Acq92OFCGtL4oChlOF94jmkxEz9+JilqgHLoUpBnAC1VPpoXvpA12iSocH22zHuzgrl
	eviZIllrX1jEdHd+0ZaR49vIi1D8mQjybk1wkNOIll81HXt7o1WJxmxX2AeXjPuDt2fu3Lt9xAW
	iUKvHRNK2kAg66tNbfA85F1Ozsm8Kfv6u+tb+TT4aG47WBoMM57NXd/Thw5avS2DACjgKiXgseD
	r4uypvQRHMNcZ/jnexSkaNUzkScvPgHDgs3+4rEVD3PWdhGOS0KEJePvBmsoOSM8h17npHG8v/u
	h14d+26OODnWq0EI/3+3k//vPSxeNJFAM3vhcY0VhnfFtLNbqjMJ+BX9NSeRT9eWb8jlNy5IIZZ
	v47LsBy9IjGXVta/sGRoZP1crg8zTK8Gd3QT2Et/eYnjr8gdqDCpA2xBTsOsTXa7Ms8A=
X-Received: by 2002:a17:90a:fc44:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-368f3e5b74fmr5191747a91.24.1778693614150;
        Wed, 13 May 2026 10:33:34 -0700 (PDT)
X-Received: by 2002:a17:90a:fc44:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-368f3e5b74fmr5191712a91.24.1778693613606;
        Wed, 13 May 2026 10:33:33 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ede2007fsm3748477a91.2.2026.05.13.10.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 10:33:33 -0700 (PDT)
Message-ID: <c4144820-c5fe-4249-85df-acd64642b909@oss.qualcomm.com>
Date: Wed, 13 May 2026 23:03:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WnYQvs5Xy3QKTug6PIcuGzrSYrjRQucQ
X-Proofpoint-ORIG-GUID: WnYQvs5Xy3QKTug6PIcuGzrSYrjRQucQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NiBTYWx0ZWRfX5UuQuy0Gzw4h
 VKg6oPJsXirg2eKcOJSoyh6KcpN6JoRxpftpG148mIEz8VB/7miMl4RbOPOlKY8rNvk+j4qyHRA
 0sZ7bRHgBxQK/GAr94BO/sKByJzMuWhOtiYcFcBIuRN2QqF8Js/UdpkGzfBeSGvYtCW+su/o3aN
 aSEI6+fZ/yhK1+5G6kfigot4olj5bWIcuszyiAaPx/tOaBG4smtWjBqiGBV2Wb2qAwB+/U9nc/K
 VL/kOHcHaSk9+21EPi3ksT2GaiYxlN7+d/tMkTOYBBtrEhEthxumwjUEDosbSA3ngJOy3dXPRYk
 YpAoha0sNls8RyG6F4w6e+T2AqoQbKkW7hbwjnY91bxa48+XSKVteuXtPhueayF2hGo0dRtKCkb
 u99GRJ+Qh15A0pHSSkJAvNwdxgdCJJ2+QMWYuoSDPAdKDuArsKvSoGpnjxku/XXtTbGMuRo9ucH
 Vuxllyu+G/BAoXwqDcg==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04b5ef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Yc6XD_gQ1GYMFn8Xh8UA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130176
X-Rspamd-Queue-Id: F2BF65384EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107404-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/11/2026 2:50 PM, Neil Armstrong wrote:
> This adds the plumbing to support decoding HEVC, VP9 and AV1
> streams into 10bit pixel formats, linear and compressed.
> 
> This has only been tested on SM8550 & SM8650 with HEVC, and was
> inspired by Venus, DRM MSM and the downstream vidc driver for the
> buffer calculations and HFI messages.
> 
> I was unable to get 10bit decoding working with ffmpeg since P010
> support for v4l2 decoding is missing, but v4l2-ctl works with:
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
> 
> The non-10bit decoding still works as before.
> 
> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
> and tranformed in v4l2 header format with [1]:
> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
> 
> Fluster HEVC results on SM8650:
> 
> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
> The failing test case:
> - Pixel Format mismatch
>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
> - Unsupported resolution
>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
> - CRC mismatch
>   - RAP_A_docomo_6
> - CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
>   - VPSSPSPPS_A_MainConcept_1

 From earlier SOC reports, 10bit tests which were failing were
- DBLK_A_MAIN10_VIXS_4
- INITQP_B_Main10_Sony_1
- TSUNEQBD_A_MAIN10_Technicolor_2
- WP_A_MAIN10_Toshiba_3
- WP_MAIN10_B_Toshiba_3
- WPP_A_ericsson_MAIN10_2
- WPP_B_ericsson_MAIN10_2
- WPP_C_ericsson_MAIN10_2
- WPP_E_ericsson_MAIN10_2
- WPP_F_ericsson_MAIN10_2

I was in the opinion that once we enable 10bit, these tests would pass. 
Though i do not see these in your failing tests, but the count of 
131/147 have not improved. Could you check if these tests are passing 
and count is better than 131 pass ?

Regards,
Vikash

