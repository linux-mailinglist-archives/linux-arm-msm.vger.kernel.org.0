Return-Path: <linux-arm-msm+bounces-94647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPZVMNhto2kwDAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 23:36:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE91C985C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 23:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D56A53014680
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8E7175A76;
	Sat, 28 Feb 2026 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE+KlMLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHYS95To"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C13F3D646E
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772318165; cv=none; b=euTE7EeieD6KCSKCaEXL35d5R+uOO59NVb8V00Fk5VOy1ll6+mlfWNClqSdRSb3Q+etzEflIrmjnG385635hdPcrqVyzZVDUmYD4TJdlFL7GdPuvu2wXOBKs1x7bWk85/oNFbORcru8wv57OwGAgsPnfvS+qTgaehV6vKBe++Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772318165; c=relaxed/simple;
	bh=Qjx2enmiIeqVS7ZDCv7tX0sl3R0stZJQ8VCaO/XeN0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfFae8Adede14qKZTraWZGNpLjv+O/DZz/jhdSxxhji33OKv75zuTX8TnMTR+LdbE8P3o/cXvBcoq6vO+2R0dH/UhcZjRfByxHw7z649umyflo/BM94Xckv5AUKH8mHcZYnFb841+oWP8dRcZW2zgFw2LQlDTTVuQ5Tl/j72Zdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE+KlMLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHYS95To; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH03mY198633
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 22:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSVXXdhiklAbM2yFXSxjzuNnDZHhdYtA0NflTFJMpr0=; b=aE+KlMLGdWoxhdxp
	meFgURc80UHtoYAnDU9tXNg9dsZ+G2NF9AT84WiQcEvEOiTmK1iB6vjTf22ceM/t
	yzzdjlHs2MQeNurjtUdmqoNTXYWqCemhTKD9TOsbRb8AL6xzAFVq+fR6DMYoB24O
	ySygX81DqaegbPB4m9F+p9Em9MIo9J4Oc3w+D4fDAtboZ5Q+5T/ZXE4CuMPwll3v
	vIYmZbz/DMgszlLxBlvCg7wAq+0L/NoPn1lwIeUKI9gUnSMsBQZNFQpwOQoGz3Jr
	tgdOXT2GTIQ08h4kwSb4whRphvZYFFa214FQ8ZlwUu7leyT3xNldhiehKD4ssjOf
	xL4OHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshchtm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 22:35:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3d11b913so2743806085a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772318157; x=1772922957; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JSVXXdhiklAbM2yFXSxjzuNnDZHhdYtA0NflTFJMpr0=;
        b=MHYS95Toc9a2a2xuTW3Tz1zPTYgOwslvcfpEJpK52T+uBKbuzdGbSjy/jv6JmQoU4I
         YluZrcfmgJ8DGFgZaTVEwffqmW1cAOG/C4bG8OUwtJPpPzgzkWAFKM8cOTjG6/uFXpAv
         2QlNSOeq4kBQDy4cHPqlqq5lAX2x+jtvepDINDBhorYwv1/EpvA81TWC43x6xkv7kGJ9
         GA4cTYk9Q8CfQ72PuPX+G26nOCTQATbj3pwOYtRSPQAbwVOuZngJU2Xk2oRyFCWty2Fl
         HkyulZhmmopfyGt4WzIdj5ijodSHbJZPd703TMJQodOg2nk8lk96VipMuCwCOR7CnoK1
         /VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772318157; x=1772922957;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSVXXdhiklAbM2yFXSxjzuNnDZHhdYtA0NflTFJMpr0=;
        b=PPY9Zf2hgwT6/h5+3F86jvDuuUVcFGrw0SqeCtiKOUYxD3nL8f5M3tOUjW2pVfCSFJ
         P7tMoYSOw56cLFGsS2pOVoqX9V5d4pgmHSFjTbAI0HizNt+DvTQqY5aE5R4W/rEGPqmQ
         0/jfBFzK64kIaTDEm5cwCZatI1cKQP/c6EAePbzjin7sDB6o5LraDCzbX/gLWuwzMc6z
         gyHiLIh3bG0qw4XxMHo3pcBXBj2hVkbk2viOJcUhQEWo3A1UiIWfh8is2U9jpHgWzga3
         n2OS/HMvyAI5WtgT+XbnUtiaorlVoip0S5IjfSKqVl3HErdbzNJdeGzkOHBh5X6/iUn+
         XRBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqOtaW/zMFH3PynzI8dZAtuRbaGgvwfeRWQBOPfZiHLFfA3co0lyKvFbnRbuKJbP2VMLfC4UdkKDowKprq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0EXcArGjws9t0A7VskswEBWKHh7UYJJrQJhauRWpl3zX2YS22
	dUWJYTDJIJyaIAPBN6LWG1X58c2XFElxp7nNCpat2gzy8yux/SWLYU2jn9nuw2PfV/VNPXemB8m
	/CQ9/mLoKEyMJvjfPd2QPz7WjwKNLTJltZMa7L9bWVm2lNncvyXn5oYhgRQCLoF0UkqVh
X-Gm-Gg: ATEYQzzuNisE1I6pjLAavS34aV6tTJnEtOVh8M6tQlKde2NlME3B7barRHvdZJzaeMR
	ODsxaCLh+Gl51LLkTohxbSpWm3ITItOXTNnfQPnOcQcmrtr0fK7pbUzEQzZ/T8is2J+GU/Saiz5
	dL7PT97RHlquxS2LGGBwkEE8dD4e14k6lfDgjSyKO5OqunNeTJOQIvFDt4GUsBUF2NevyuRILYS
	dBwcmrQ3/ObCRrGocZu2VJNDJhSmiQXa6MzcrSPFnH8vq4AZSNmzbhhCQja3VoDjiklO6DhZh+C
	2FZGaXgAUT7o+QEfbX/4Ja5leSyElUXw38tfkyi3VYSTFPO8NPOateXeGFMcWpb62s11mFZjshf
	e4D0IxK/FvKrO46temB6ZJVWaKhM2u8h2tHYSyj0sq5G3P6hBu0kcetzuOcBfdUYZmJlBGj9k0j
	VqmWGYYgVDzJEDA36IFNPfIXic3DTSxVnvHkQ=
X-Received: by 2002:a05:620a:c55:b0:8c7:1afd:a535 with SMTP id af79cd13be357-8cbc8deb5a6mr874742585a.25.1772318156886;
        Sat, 28 Feb 2026 14:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c7:1afd:a535 with SMTP id af79cd13be357-8cbc8deb5a6mr874740285a.25.1772318156332;
        Sat, 28 Feb 2026 14:35:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2ffe126sm20763411fa.23.2026.02.28.14.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 14:35:55 -0800 (PST)
Date: Sun, 1 Mar 2026 00:35:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: allow interlaced video streams
Message-ID: <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
X-Proofpoint-ORIG-GUID: ogB_qA3AiPx5D-ZTvcLUT3y3qwBUmYmd
X-Proofpoint-GUID: ogB_qA3AiPx5D-ZTvcLUT3y3qwBUmYmd
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a36dcd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=bpn6vdTzkl7E8uVklXUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDIxMSBTYWx0ZWRfX6qPc3PAqDx8M
 LMpxVLHl1vKGAqkOEByRW52CxWPNh9cxk6BcZ7EN420Kt1ySlg0bA+4PRiVyOh5f9bc3kzKC3Q3
 7bpMioJ5chBYYrkOKHKIGo72rVDhaMrjd6BTy42caiBLfzlD3eyOs5cMzvuWCAzXC049zMsmxwv
 nOP6NlXp47/NG7dePYQoIc9593MFGlRB3kq434lgcoWja7FmWOS/zItf90Wp/hssY0W/YeDe9tp
 PfdyQjhPmKa0cNT9qwukUscKZAQLXTuWJHZVr1ywc9UECKMMwes/6Tkik2uqpkODdYe6WJV2cbz
 4zLIho3TuwZOwQeStNUYUbqT38gk8nBHAEuZGOVl2vpKLD8zTOIuiK5IdPGt3cAKX+ODK4Fkf4j
 ppJC6pRI9HxjlLKSRjMLZfU2Da7yyRLvCv9X59YuXP6aKAuQ/B/0mS8/Mn0n4zHzGoCjxL32uNc
 WpCnxZppJeHXP2l0YWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_07,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280211
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94647-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28DE91C985C
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 09:54:20PM +0100, Piotr Oniszczuk wrote:
> 
> 
> > Wiadomość napisana przez Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> w dniu 28 lut 2026, o godz. 10:49:
> > 
> > Venus driver errors out on the interlaced streams with the 'field isn't
> > supported' error message, which e.g. prevents decoding of the MPEG2
> > video streams. Don't error out if the buffer is set to contain
> > interlaced data.
> > 
> > Tested with the fluster enabled to handle MPEG2 through Gstreamer:
> > 
> > ./fluster.py r -d GStreamer-MPEG2_VIDEO-V4L2-Gst1.0 -s -so venus-mpeg2.md -j 1
> > 
> > GLOBAL SUMMARY
> > |TOTALS|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
> > |-|-|
> > |TOTAL|30/52|
> > |TOTAL TIME|75.526s|
> > |-|-|
> > |Profile|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
> > |MAIN|26/32|
> > |PROFILE_4_2_2|0/9|
> > |SIMPLE|4/11|
> > |-|-|
> > 
> > Fixes: 059790467bf4 ("media: venus: helpers: handle correctly vbuf field")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > drivers/media/platform/qcom/venus/helpers.c | 5 -----
> > 1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> > index 747c388fe25f..71e79093a4c7 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.c
> > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > @@ -1466,11 +1466,6 @@ int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb)
> > if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> > if (vbuf->field == V4L2_FIELD_ANY)
> > vbuf->field = V4L2_FIELD_NONE;
> > - if (vbuf->field != V4L2_FIELD_NONE) {
> > - dev_err(inst->core->dev, "%s field isn't supported\n",
> > - __func__);
> > - return -EINVAL;
> > - }
> > }
> > 
> > if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> > 
> > ---
> > base-commit: 779cae956c8316aebc1946ef86ca001f99658270
> > change-id: 20260228-venus-mpeg2-495f9187a1ec
> > 
> > Best regards,
> > -- 
> > With best wishes
> > Dmitry
> > 
> > 
> 
> 
> Dmitry,
> I applied this on 6.19.4 mainline and give run with interlaced content (hd tv) on qcs6490 (radxa dragon sbc).
> Playback fails like this: https://gist.github.com/warpme/a368983678af0a76af85314808773076
> pls see a bootom kernel output showing venus failure.
> my sw stack plays ok on e.g rpi4 stateful v4l2m2m so i think root cause isn't in my userspace....
> pls let me know if anything extra is required to fix venus decoder issue.
> br 


Interesting. So, most likely, H.264 decoder can't cope with it and we
need to allow non-NONE fields only for MPEG2. Let's see if Vikash will
have any other ideas.

-- 
With best wishes
Dmitry

