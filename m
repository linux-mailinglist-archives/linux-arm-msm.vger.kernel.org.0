Return-Path: <linux-arm-msm+bounces-76509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6BBC6FCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 02:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 712393C0D43
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 00:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD0072634;
	Thu,  9 Oct 2025 00:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Or1jK3MM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D0B38DE1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 00:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759968971; cv=none; b=mowlznR4Ooq0QGuR8+kjK2gjBkzDwlkYf+dBK+4p9Po1DPnPeszCtG9RTgpY4oieXEdwCzQvfSxOarpunyVcDmEr3OALc+W+Hu80Cdp/5xY+uPsztPWGd4sBWGfa6XC4B2oKjPbl9HtTodrdWoJFkungFCAMAgaFxRlJaKdrqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759968971; c=relaxed/simple;
	bh=9P2UuZfyLde79jztqRTF7xV24Frl6wIZFMOHPPr7Yjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5rHmMBmzUCQs63aUsvNSO6K9hJdn26lWGBq2wQUJQhS0twFY6nSEFhh3jccG2KrFbDIeImaQvbgjnI6dkce014WtpeJ0mzbDt6U1jh7Lrq0rYQCAWj00r6hz9fNGrkGkb46a+zLcgW1IkJLqc8F30SWyytp7/aJp6VxufLDsHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Or1jK3MM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5GU9006709
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 00:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dJZI990cPhiKEcupHn1z/ZmL
	7wedpaV86BBbV5UT1D8=; b=Or1jK3MMk9qWodsJj+eU31JIaGGvH/FJHT65sDhK
	+7JQUX5F9Lfulii9AEddr/4sIS6vEOI4d0aAGZnUXoSC/s+zXAVKhOk+SutKVt/q
	czjAqmS4PRAkfURN+5EXmPcwzcwEKTDoYaeU/ClfKNSz6qBmTB5MjdvAFYw1DdMr
	iThEp/L+DNPf1hgla2krBPlDvCwi+xCaRDQkz0jd6FeVq7Nj/IHIQDWRMzPdfkst
	nDSgBPKZ3YRF855nm/uIs2mZZyVH4hOzHeXzTGh/sn8EKRhHiX5GYFQSTwkkayep
	cQV9JqoKszJxP44h0ipKc8NE+11UA1oSW7EpgEYVNTJANA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ngxgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 00:16:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de801c1446so11861051cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 17:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759968968; x=1760573768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJZI990cPhiKEcupHn1z/ZmL7wedpaV86BBbV5UT1D8=;
        b=oa2HvUX7aCnAYVIM4dOU7xsvdwjdsOOqYuRnpjTUmjKR9eLKaEkvD9XVaMPxvTkTQv
         ++UAFCpDxPxbAG3j8nNL/WDj5IZQlfZhpRxmtuot1uGhp2iyO8utNgON2QYe36stGEXA
         IGoW2eTVPbW1km7HkgrZ300CVAoEvLMU850EyPPQg/JTK0PtjEF88/fP5rLxo1u5szzu
         10zHilbPOw5DiG0icmbKD570opLOX8tSQuRVzYBqhhWb4pY/CZl4qxHB/+q4m++l50Ia
         0Sa5jdnx6p1nZNSHo2UimBlgSlXj9H4DFHaa8p593l3oNpvOqGJLhYqcpfQtH2UTmtPW
         bqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPelJgljnIjgUbsxhuG7qItZZl/5IqTjGkOe1M0oD8qkOAr80Avc7pK6rilZXf1Al3WRZJn6SzRT6irJ2k@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb7UCfyS8rqhqOrT2tX65R14NWJWt/5fYS5Eh0qaDa5dGGyKRv
	uUvWaWx98P25jfKygzEM10Ck6vxYh/XzP0a9e76bImC578/capWoMOOy8waqxNSiv0qUYs1lE5s
	csu2x2exiFZ4wT8Bkgf/CAcRjRQqNcTSTgdQu8lINMdgvm9ydAZnw3nkjdbjwPsQ5rrFuinWd25
	aP
X-Gm-Gg: ASbGncvUdeuilgloc6h3yLQN0UF5kDU4kOx1sKFM8YchsxKYLDuxJT9qaFkSWZHhXxY
	Jo/lmHbRgcfYEQymKtulfQJz+BXyy/6i6kx/a4OLnfVSvjwDH/ySxPdG2XbPvFjzzOlQ9kSt0QK
	cK9T6XKzPppPc5nydHy0y+bgg6I/47mWZDjaWN8QlSU0OmyQ5OmZjncCJOd41vVv8bslCegejOK
	oVskhyXaP1VWU5D72Re0ejFJnBN8DwziJ3N8BdhB+NFt7OZZ+MbGPYh+YFyOzlgWa0vX8RKA3CT
	hk6ctl0mngQFWTuqprtUpfcpit5/6qjAMQ+eMbtlvquglZQfaAmDeQAvGCQhDq1NHRxvJwn2pLq
	1W2/biPr1meD8F8CAXBaKeAaRuRSGfFqE8o8BXhwm5bR6oSI2hiOXmzKcfg==
X-Received: by 2002:a05:622a:400b:b0:4b7:9f86:8705 with SMTP id d75a77b69052e-4e6ead5c61cmr65441181cf.65.1759968967620;
        Wed, 08 Oct 2025 17:16:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwFXlgUuHcfzLU3WPMp9WV1TrH+Y9SK4xU03O2HVIo4YAIphVfPQnmwW+42AaHDBudLsn2nQ==
X-Received: by 2002:a05:622a:400b:b0:4b7:9f86:8705 with SMTP id d75a77b69052e-4e6ead5c61cmr65440931cf.65.1759968967163;
        Wed, 08 Oct 2025 17:16:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3a1a4ccsm23603381fa.27.2025.10.08.17.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 17:16:04 -0700 (PDT)
Date: Thu, 9 Oct 2025 03:16:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] media: iris: stop copying r/o data
Message-ID: <rmeerm4hqcdxqjmylbfep7enswzrypqfyhl2yka554m7mo4y3s@4ycpb6eeojpe>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <MNE6-NWyEnaQyvn4In-jfg6F21lf0p0GgcEsRO6lM610hKJwSHgpSoefqJ7PROY_eWIuyd08U3G5bDI8ufq0aQ==@protonmail.internalid>
 <20251008-iris-sc7280-v1-3-def050ba5e1f@oss.qualcomm.com>
 <b58f9dd3-6ace-474f-98ad-a5b9c5f0cf17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b58f9dd3-6ace-474f-98ad-a5b9c5f0cf17@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwSGuWzmjBko3
 0OhhJbrDapk7eHqacOHqxQ/gzTFZE8etBmk9oZ5J9gcwKL+wyR4v9sRvO8ICkf8yIV7shP9AFdY
 Mq56ZHLdWU9UMFf/CbAqFVzn9r4e1DpYZpVnReu2u3j0BLjx+pbpRIuEhtYHRzXh+Eechoae20P
 Vyc8FAox10/P493y/hq0qoq4oyHqxZ0lbxFy9japnSJTRo3mllh5RDLQrCllSu6i3W42sEurSWh
 4/t8vvtLWXhsPgMy1m+AWiiNP9zynr1W4dQBYxxCScTASt5dJILIQdP+BHh8a2aJIMsgjTmSoP5
 GjxMLIoYWb1f+eyxhgdaoi5Eb3Y4IQ6TtG4FFqh2qjef9sGKUj1tMo33ZdzIzoV4JhiTYKEt2rf
 YadOHN8CHVaRUNhkiVJEMx5Rxs82fw==
X-Proofpoint-ORIG-GUID: qP0KQeWggu82Zg58MmuppjogQmuKiOY3
X-Proofpoint-GUID: qP0KQeWggu82Zg58MmuppjogQmuKiOY3
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e6fec8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=hHaQWnhJ5brMnfOsllkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 12:48:00AM +0100, Bryan O'Donoghue wrote:
> On 08/10/2025 05:33, Dmitry Baryshkov wrote:
> > Most of the platform_inst_caps data is read-only. In order to lower the
> > amount of memory consumed by the driver, store the value and the
> > corresponding indice in the read-write data and use the rest via the
> > pointer to r/o capability data.
> 
> corresponding index

Ack

> 
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
> >   drivers/media/platform/qcom/iris/iris_ctrls.c      | 238 ++++++++++-----------
> >   drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
> >   .../platform/qcom/iris/iris_platform_common.h      |   8 +-
> >   drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
> >   drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
> >   6 files changed, 135 insertions(+), 128 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > index fb194c967ad4f9b5e00cd74f0d41e0b827ef14db..b5037ae8c71921753c165a86a277a4a4b5083b30 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> > @@ -115,8 +115,8 @@ struct iris_core {
> >   	struct delayed_work			sys_error_handler;
> >   	struct list_head			instances;
> >   	/* encoder and decoder have overlapping caps, so two different arrays are required */
> > -	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
> > -	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
> > +	struct platform_inst_fw_cap_value	inst_fw_caps_dec[INST_FW_CAP_MAX];
> > +	struct platform_inst_fw_cap_value	inst_fw_caps_enc[INST_FW_CAP_MAX];
> >   };
> > 
> >   int iris_core_init(struct iris_core *core);
> > diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> > index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38 100644
> > --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> > +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> > @@ -194,26 +194,28 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
> >   {
> >   	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
> >   	enum platform_inst_fw_cap_type cap_id;
> > -	struct platform_inst_fw_cap *cap;
> > +	unsigned int cap_idx;
> >   	struct vb2_queue *q;
> > 
> > -	cap = &inst->fw_caps[0];
> >   	cap_id = iris_get_cap_id(ctrl->id);
> >   	if (!iris_valid_cap_id(cap_id))
> >   		return -EINVAL;
> > 
> > +	cap_idx = inst->fw_caps[cap_id].idx;
> > +
> >   	q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> >   	if (vb2_is_streaming(q) &&
> > -	    (!(inst->fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
> > +	    (!(inst->inst_fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
> >   		return -EINVAL;
> > 
> > -	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
> > +	inst->fw_caps[cap_id].client_set = true;
> 
> Why drop just this one bit - CAP_FLAG_CLIENT_SET.
> 
> Code seems neater with that bit retained in fw_caps to me, you have fewer
> LOC changed that way too.

The problem is that all other flags are read-only and they stay in
the constant struct platform_inst_fw_cap. The CAP_FLAG_CLIENT_SET is
dynamic and it is set for each instance. Initially I kept the flag and
copied the whole flag set, but it resulted in a bigger patch, because
all cap.flags lookups were now using inst->cap[id].flag (and there are
more than just CAP_FLAG_CLIENT_SET). In the end I decided that it's not
worth copying r/o flags, but instead we should separate r/o and r/w
data. Thus CAP_FLAG_CLIENT_SET ended up being a bool field. I think it's
more logical and easier to follow the code like this. If there are
multiple flags like this. we can always change the code to add
INST_FLAG_CLIENT_SET.

> 
> > 
> >   	inst->fw_caps[cap_id].value = ctrl->val;
> > 
> >   	if (vb2_is_streaming(q)) {
> > -		if (cap[cap_id].set)
> > -			cap[cap_id].set(inst, cap_id);
> > +
> > +		if (inst->inst_fw_caps[cap_idx].set)
> > +			inst->inst_fw_caps[cap_idx].set(inst, cap_id);
> >   	}
> > 
> >   	return 0;

-- 
With best wishes
Dmitry

