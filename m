Return-Path: <linux-arm-msm+bounces-88164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E79DD06DC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 03:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B36783005483
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 02:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560A4315D22;
	Fri,  9 Jan 2026 02:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSX89Ts+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5Bl2Ih/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A3831062C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 02:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767926047; cv=none; b=sNoXNI6fhaVk+JIoSAQhFQFVTCJoaZf/NlPRKFGYN8rqtWsl+QCglpXumEaRN0mIboGtci9ARzIcZeG5UJJYp9TXL5dCbGFJ7VGCkHBXqHl3aedGQCvyJQUMHvXFBufcgPeaUYm68W3q4H8bCL9ZXtqMvcaJzjjtD6daPuhanPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767926047; c=relaxed/simple;
	bh=IBX+xv69uFP/pcSBHjI9RUUY0+z8+gLHuXhIxtKTIOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGIuXBZso7qtBosf6Gp+Rh4LBGkGWYE7K50hgPixRavsR6woj/gsYkxVQmCw9V69oi5JU/nvjMUWyHqYdURCSZXvb6JJo8LmWCBzEz+alWkQ4WSVCAAL32qaCMPvP49kUKnQo6zTS94HHiu1ekwQEhh1fIZ2P0kZge5Jm265dQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSX89Ts+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5Bl2Ih/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608HkBd82153229
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 02:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pjAzBejL8JL4/IEU54yimhls
	JPnHrnNM1tihLzjWhOg=; b=PSX89Ts+xSMLquA4sVNQHb8D4md0+wCHyXv2hmxZ
	2nspvD1wkB846keLafxbhfJY6PfiqpmYW0n870KkOfUcHTLb4PzFlewXZoAqzRu5
	qdypCCcB69i830lVCMDpj++9waQGL0Hhl6tEfFxfIyszEah9VR/S0a6uYaSweDVx
	23sv/pT+xSMktGiZ5ZGHT3iyS7hz1b0XhTzFcLvHY/7I+6YJRJvKfhRAOvbS4ce+
	C1FOlTjN3OqqehOVpyverbwTzYSVbCXCcleCZsQyFtIFN4MFzn2+kjDsgW0RAVAp
	O36rIICbXTgp/4uZLcMq49YFdC/oJVfZYxcgVhrYaWq86A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d6c291-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:34:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb3388703dso1419120085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 18:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767926044; x=1768530844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pjAzBejL8JL4/IEU54yimhlsJPnHrnNM1tihLzjWhOg=;
        b=K5Bl2Ih/OM2jikE0THRMmaeAysCgR6MtjVjx1WXANO1n6oWSwRGHu6TZTTtfnApqyb
         gsxubgWkOELMKYLwrrovtjxyCERKFujXXGuxEWGNkeTpBv0oumPxpfbnUsAb9vN4ZsUK
         BID6LiMMnEewMvijtysRzkKjP5FSA+XwuntdTFlQNG+A1bYV1AWEU9Mu+A+h9muY8HlT
         u9ner7zqIuQw+YXixMho1Xmd8oUoIM9mPrT9EnqQBdOdpi6zqS2igOCsq+7tZ/p5PZ8T
         fyTHLjeQ3ZO7hYr9/xQvLP6O4JBuEQ7wZ/Qn+L6kduBAR6wY62F0pn0GmdFyP2zrmL9z
         MAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767926044; x=1768530844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjAzBejL8JL4/IEU54yimhlsJPnHrnNM1tihLzjWhOg=;
        b=Qsg/P2zPTqnHncF44fkKf1WLDzGdCIihPu42R7N3R9RqWdBHt+IPdxn9H36bO0xo0z
         HmiaoAdbfpxGAWIjXtkDypPKCFVIJSTiv6SoddyhEMJaw132Iz1j7aQ7i6G1d9g9HeYX
         gMUwZIpnEIFZ1SCZ3YzBmkupU6fUL21jdqZ/jsnx+FM8saI+ry6XwGRnz86f6skwdd2g
         hIRfH6Us9pUKn49/U301+J0WTuGi7x1x1Zjb4VgwacXxRWTSKnuP7iVKjzvR25HVV1td
         KagUl3AZmFafM3mmUeurt5l3NIKhI8QugjwURKW6tLsUJv2yZcgxBqqJzocfFzOtTVhV
         pMew==
X-Forwarded-Encrypted: i=1; AJvYcCWbFwLsw+NZLmwL3BOMOJqrEsSwXWTe2bXpNv7gpy9fYlF4/9vqADC7LITIPz/bznTFJ69u1dyFfKflMBgO@vger.kernel.org
X-Gm-Message-State: AOJu0YygP7iTrkcehL59JfCTvOYoSXPjI4qB10n9Pz2FqO8JlJPvu5TC
	gFUHNlDl+v1HnmQV/zY0FzCsa4IqlHNa/JNEWd3W7BWSToG7Wj5PgX7HmASop3DU8QY3cJSmGz1
	+c11Ew0UORD3syIU+mdbk5GfA/1w4PvEuM2GcVLZQ6/dhA9++pd5PQh0TpD5DTlwyZ10A
X-Gm-Gg: AY/fxX4cuBhMJy+OIUECG/0Y6ffJxRF3WUG6q2F2d9ZUwJqMvUBGhv5TV3JUZbFNNQc
	JGJVpzfAlxdW0mboJxQlN/QDHjyX18+nnRYyOJwQX5+zGgnm/QGKBKGa3aqFIr584rpIYCDOHIv
	wS7BcL8PLFjzA13rJc0bkkbiJC3/XLE+tXCAIUv+1a8jJ8tbl6BkVbibwNHZ5p+/BXcPFVGNXQJ
	+K9R4jvRJM67Akng7vL9KPYbiAAPMRYlS7wCtqB93/2hx1uh4bfXAmJueVpF8DE1qzqTwaEByrt
	mEej8j72Gf65bOIvpHL55PbZTbtr3Pg+fvm3sjy0iWxpZBVicJ3ZcteDM74RGNkMQcss/cp/cMh
	BzYIqKu5gFCOlqOGlvIRPesEHeUtKFzXktxKsd5AjkE5dFCsTGJjbB1Kwjfyt+lRj0RKl0IQ=
X-Received: by 2002:a05:620a:690d:b0:861:119b:3052 with SMTP id af79cd13be357-8c3893f5aeamr1222802885a.51.1767926043853;
        Thu, 08 Jan 2026 18:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENTUJZuyzQYyKEXuwN8Frzm1IG/sJYpeF6AXGlDy2+lmsKBcuMwUivs/WYg5LuI8xNKsyVkg==
X-Received: by 2002:a05:620a:690d:b0:861:119b:3052 with SMTP id af79cd13be357-8c3893f5aeamr1222800785a.51.1767926043408;
        Thu, 08 Jan 2026 18:34:03 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f54427esm753223785a.48.2026.01.08.18.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:34:02 -0800 (PST)
Date: Fri, 9 Jan 2026 10:33:52 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v5 10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block
 support
Message-ID: <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
X-Proofpoint-GUID: 2Xi7ZydGgzmqRFvE25gszg_2N5Mmu2OX
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=6960691c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ry2Wfz2E4BY8SyJT9oIA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxNSBTYWx0ZWRfX+TP0fzvTJ050
 omZlA+jRNQiochu1MGIdN9B9kFcPCglFfzwMN5uGiIF1HPumpOlFZ3EUu0I67U6kEwRrMI/AF3s
 G3gy7S6e6S9hTeIrDl6xRj/XtUhhQ94i6ZZzUaA7FPS13hKuB85f7/Qv+KBf6LaOHlc0zue2tcI
 sCoABcoKE7RizrJXnA2gSEG679vADXlObpmyCdY5YzeiqEvOuKNvaSnVUu0EO3fbtd0/Iv0OPBi
 Vq8KNUrfRE0V3RDh3mUUEXkMSZmPIqAMe8J7nOQ6NIMKBwL5vQGnHjqs7JSvGtuuDRhjcnWqcHW
 coeoPBnRxUtn0KF3UFqd/gNzq4qir9vwuwx0swoC+3fldJFdYh8NwRl4GKpKHVwkqwgGW7uolRA
 g3IdWqCRqYVdEZvrXXlTqcZcmVUoL8gsXaNMnL6wSu92W/FZ5L/ofwTV7DOL8ZNuP0q6/rAEs9n
 niVgFNXu0uZUeZrfe4g==
X-Proofpoint-ORIG-GUID: 2Xi7ZydGgzmqRFvE25gszg_2N5Mmu2OX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090015

On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add support for Kaanapali platform SSPP sub-blocks, which
> > introduce structural changes including register additions,
> > removals, and relocations. Add the new common and rectangle
> > blocks, and update register definitions and handling to
> > ensure compatibility with DPU v13.0.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile                  |   1 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> >  7 files changed, 371 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> > 
> 
> > +
> > +void dpu_hw_sspp_init_v13(struct dpu_hw_sspp *c,
> > +			  unsigned long features, const struct dpu_mdss_version *mdss_rev)
> > +{
> > +		c->ops.setup_format = dpu_hw_sspp_setup_format_v13;
> > +		c->ops.setup_rects = dpu_hw_sspp_setup_rects_v13;
> 
> Wrong indentation.

will fix in next patch.

 
> > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > +
> 
> >  /* QOS_QOS_CTRL */
> >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> >  }
> >  
> > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > +			       const struct dpu_hw_qos_cfg *cfg)
> 
> Will it be shared with other blocks (DS, WB)?

yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.

So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?

Thanks,
Yuanjie

> > +{
> > +	DPU_REG_WRITE(c, SSPP_CMN_DANGER_LUT, cfg->danger_lut);
> > +	DPU_REG_WRITE(c, SSPP_CMN_SAFE_LUT, cfg->safe_lut);
> > +	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_0, cfg->creq_lut);
> > +	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_1, cfg->creq_lut >> 32);
> > +	DPU_REG_WRITE(c, SSPP_CMN_QOS_CTRL,
> > +		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > +}
> > +
> >  /*
> >   * note: Aside from encoders, input_sel should be set to 0x0 by default
> >   */
> 
> -- 
> With best wishes
> Dmitry

