Return-Path: <linux-arm-msm+bounces-90729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMlAD/6geGlQrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:26:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1F9391F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BAA03004690
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE770346E56;
	Tue, 27 Jan 2026 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKmmWLW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jU5f2ic8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27476346AD1
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513209; cv=none; b=DKBW/AAMegEb8jo4YP0Mfg3nyxr5y3wmA/Eu69l4+pZeBJYvIeDzZ8fYun+LW8DeNqvWnaJuqsvWw6NtpekB4AzmqTT7AS8UIE4tbRG7XNfHXLlY4RKnEd4a0yQ89GuqBmT4v5BsVQxqGTRcUf51ogvNWO4F1F/IQvB3Az7iusA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513209; c=relaxed/simple;
	bh=rgrYVjGNcBcrE9oeJPVBno8Lt/YAMWDEC79bWmIJR6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bu+BS9clDWaiWIESdtFSB/up7RyIKM8Cc+6iIDTbPMbwyQqIocs5xNcy/ENW5mRdPxjrPVjB0BrmWJ24e+Db6UvR+eRt8pkSOY9GQe8KJMisbe1MZP6TiD/vaS3BMuG10kXJYUlIQ93EJU8mVo0+CpcoHJ/qdRCAF46N9qs881Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKmmWLW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jU5f2ic8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAbvpq1268765
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSFWjKOmQdvYxWzHnlfk96Wt+02KeMlBMvjq2MCYtWk=; b=ZKmmWLW+NjXvcmhH
	688u6kvG4+P2ig6wsUHMtpXzyAYd+dDw7fSYg2tBmQMIrGMbhGajrP4FdxHF30cR
	Eib6w7hTc9Hr01MGu5Yv5GfduqH7rearqrcbPy3v6I5LuxQRECi54Qpl1/dgtkC5
	qPsVWXC5CqWBfpgTHT4+hsd0HauKRGVX+W2vMEC5q2F+r8enxgN4k5bZ+8Hk4bJn
	8DGJ0TCnAFLIy1PDyWNcVE8H3V09DSJ/1jG12Do6QI4CPBk17UoX6Juxb08pIdg1
	0OtOigvPzvk6u8b+fw7mw/tX9htYRPAgWtpL+8j5O0OHl9GSjXjW0EvvBalPQUUD
	M6vi+g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasfpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:26:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a76b0673dcso53355255ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769513206; x=1770118006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSFWjKOmQdvYxWzHnlfk96Wt+02KeMlBMvjq2MCYtWk=;
        b=jU5f2ic8DgKykV06UIBRWV8DnFJvwocL2SG04eYiEMW6tmjc5jfgHT4+iicvK0lsP7
         f4aFwDtvD+PSFxaJCp/QrRNeH5cNKmUlpF5/wxmE55u8/Ie4tkfHYSqdLOrsPSQmY0G3
         GkNTO1tXopxEa1yYck+6BX3wcFtmKztM8zrj6im+a6RyZgC+FKvgg7r1nAgsL4frygoL
         hzdYMjsJiB+BiLAIt/mBtb1DhOx+hlAoWZsSanM+8gDkin7L44xb3Hl2enzzGKRueZyT
         EsWc/CD5Ofrl3jFmr8g2WaRae37cpuRxj+hkFwDq1PQAx9mZRnrlPBiu90nrz+ZaTrnQ
         hIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769513206; x=1770118006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSFWjKOmQdvYxWzHnlfk96Wt+02KeMlBMvjq2MCYtWk=;
        b=xI14wAHKFrbL8W/ID7qoMsHvObS/YbCgNMiwx12Oz90hN4P4gxM7R/IehVnq+y8b2a
         2R0oGEbkutKdPwYv1rFEx+YA2bqETU7ETRQQwk+tz2iU58GaiQ2OBpYiZXF8OUqT26Jz
         o1NsvZqqIhEaEkBi4O9QRdw0q1ZJcCiB7qCfKM1+ismYPz+u+PvUIGLFYW8UjRGff6hb
         1qKX9MMpHZEXzFx3rrbyRUJ7PjKul4MyOgpixRtaN5ZmV9GQTI2ZltYQ0CEEH+a4m8fr
         ew3TLNQxG7gJ+MVUeOEf7W7CIjw2ebS8BWpNXetFl2MSoxCHghJMRFTCXc1Fj0xL9g9e
         hvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYvcmWJMTAlvqOGJjq4+ddGOj4CiYPgFxtzaolCXufG1b8TvucRMD3WtKVRnE8y9MQm2LCzdoZSGSihze3@vger.kernel.org
X-Gm-Message-State: AOJu0YyrVu99CRjtiA75yAnyl5I779TcrBbvSbVpvk/iBb8u0p/P7D0P
	DShERht2YPxEd0FXU6pjiW7hYy2JqYMP/WkMgvpdj420HF29NW/e+SB7W8C2mRKw7ZBOXi9PrHC
	NJ9yqMk8UDyCPZFFIR/OurNydQ3eLURMhsBrrayrs1FbmGSrYMw2PIl8vop1LYjZQ0J8d
X-Gm-Gg: AZuq6aLq+Fgg2aeo+lWafkZYjiUvE6oboY7nf8SKae226M0NqmoydkpHBD/cGMJGJWt
	DdSWMW6ZHbonxXfVLDq0tMspbFRfx1p8hN8xvcdkkVsc+7Ju9HWMA8i2KKUpz3FHvEzgoE9pQM+
	ur+gsOqYnAnRP8LjtdcxajQwudWhOqrY8HwwRzyPEbkQyZT71WqShLtfBBhT6Gh9y0E6lij4lKV
	SqTdexWoUCkZN0LHdxsusm44JJdz7NQeIJ+hBjYO/9SRRbOomyvBk9ZaAKXoGpWF4WqyDg+9WRn
	c+yMkXCelC1HNVvDKDV78NAgbvRH66M7/t53NCZL09d0KXkDLEmcsEwFznPrOXztMH/6KW5xZoT
	X+MeM1F3YjfzbJ9tFIY1LQdkFML3E7vWr2ZPjUuNeKg==
X-Received: by 2002:a17:902:e811:b0:2a7:c21e:398d with SMTP id d9443c01a7336-2a870e34ab9mr15009135ad.32.1769513205804;
        Tue, 27 Jan 2026 03:26:45 -0800 (PST)
X-Received: by 2002:a17:902:e811:b0:2a7:c21e:398d with SMTP id d9443c01a7336-2a870e34ab9mr15008695ad.32.1769513205241;
        Tue, 27 Jan 2026 03:26:45 -0800 (PST)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb063esm113820875ad.85.2026.01.27.03.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:26:44 -0800 (PST)
Message-ID: <2d4632b2-916a-4eda-ad08-44af68461dc8@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 16:56:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] media: iris: add support for kaanapali platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O4eiWZSiVmjFts6TNbii4Xq2CUDWpibX
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978a0f6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IkwSlwTgAPm3BNmR4DcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: O4eiWZSiVmjFts6TNbii4Xq2CUDWpibX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MyBTYWx0ZWRfX1s1SluQngNXr
 mfgNkxW/EAgXrh+JP0oeE9EbcWMYO+xS4juJYc5qQkmlSwweElfS9KqMOI3aSi5bI/fQaEpolpm
 SnJhyNzKqqPY0POzRXGuPnwasbz7ne1kO4oA0d9oiyCTUV+xaCD5hUe06FhEPnbcvWB4NLMTBZx
 YI6cf7m9/uzZmPS3Ko4oQuZKGlsbcQYmViXDBJSFe5nRRDUXZXOrrW9CK4VCkXKki392RD+FgOE
 A0bepvcr62D7M6y3yCCV2Gy6Na+HLEMZmcNbNHdNbA5011b7g/w2o5ORvqgNElJi4bpadLdTeGp
 VxPkxK9XWumMcZ/M4xSAJciDfJ++IddwBaEivEyM/IkB7XVy4FOXDd4ZkLsDGGL1wtLskeEUV4n
 HgjVdLLMTmdOgoSfYTGjTgFScxTq+ZgmsgiURJZhMDsC0uh0Z2FovcRrVXfpgjRgEkrULcOUveg
 jQTwV1ui0XqVQJSwQSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90729-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51F1F9391F
X-Rspamd-Action: no action


On 1/26/2026 7:08 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 05:55:43PM +0530, Vikash Garodia wrote:
>> Qualcomm kaanapali platform have a newer generation of video IP iris4.
>> The hardware have evolved mostly with respect to higher number of power
>> domains as well as multiple clock sources.
>>
>> The series extends support for multiple iommu-map entries for the same
>> input id. Considering iris as a client driver, it adds the handling for
>> multiple stream ids from VPU via iommu-map.
>>
>> This series is depend on the below series:
>> Link: https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/
>>
>> Following are the compliance and functional validation reports.
> 
> Please validate with fluster too. Having a "knowingly good" command line
> is not a validation. It can't be reproduced by anybody else.
> 

Below is the fluster result on kaanapali (will add in cover letter in 
next revision)

H264:
77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
- 52 test vectors failed due to interlaced clips - not supported
- 3 test vectors failed due to unsupported bitstream.
- 2 test vectors failed because SP_SLICE type - not supported by the
   hardware.
- 1 test vector failed due to unsupported profile

H265:
  129/147 testcases passed while testing JCT-VC-HEVC_V1 with
  GStreamer-H.265-V4L2-Gst1.0.
  The failing test case:
  - 10 testcases failed due to unsupported 10 bit format.
  - 4 testcase failed due to unsupported resolution
  - 2 testcase failed due to CRC mismatch
  - 2 test fails due to session error (under debug)
    - PICSIZE_C_Bossen_1
    - WPP_E_ericsson_MAIN_2

VP9:
235/305 testcases passed while testing VP9-TEST-VECTORS with
  GStreamer-VP9-V4L2-Gst1.0.
  The failing test case:
  - 64 testcases failed due to unsupported resolution
  - 2 testcases failed due to unsupported format
  - 1 testcase failed with CRC mismatch (fails with ref decoder as well)
  - 2 testcase failed due to unsupported resolution after sequence change
  - 1 testcase failed due to unsupported stream

>> gstreamer test:
>> Decoders validated with below commands, codec specific:
>> gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
>> parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> 
> Neither of these commands specify, what exactly was validated. They
> specify that you've validated _some_ videos. It's impossible to even
> reproduce your results, because you don't specify which files you've
> used.
> 

commands are shared indicating the pipeline used for validation for 
different codec plugins. These are some basic encode and decode 
commands, and shared for reference for anyone to pick input test files 
of their own.

>>
>> gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
>> parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>
>> gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
>> parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>
>> Encoders validated with below commands:
>> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
>> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>> location=<output_file.h264>
> 
> At least these should use test sinks in order to be reproducible.

it is using filesink in the pipeline to generate the encoded bitstream

Regards,
Vikash

