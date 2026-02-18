Return-Path: <linux-arm-msm+bounces-93242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIKFNJALlWmqKQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 01:45:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F521525FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 01:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CD7A3033E61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 00:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2927A274FE8;
	Wed, 18 Feb 2026 00:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MehId1me";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yz64demN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B9D1F4631
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 00:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771375498; cv=none; b=cVItVaXQsH0T5GyY6wqk8qRFpYOWpjrgpZ5ylDpcpl7y0WCcmWJfdhLbgHDGXK6H+zisWIg2wO24wf5Qc1REK4zqQxEPsn1LNSk5FhasUStX4scsdGzsNrrRCrxkpXfygm2NRdgdavJyygEYnlRe2H5qy2mzvO6wMUq79+Ht0HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771375498; c=relaxed/simple;
	bh=KmKzUkSj7/o8XNJvVDn3KdduciP7Cki6QqteHDBEF3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbKbpWn5YyUEUBePzNwMcS9PLamD75P289XTKnNFW5k1Ai26fjqM137Vey/D7J2ID4D+Vd7QDjXw5wyiEL9lAl4W7lCCNe5z6OJWUQvd1F1h2qhG5quHAU8kZicG0K5aPgksay1udZIzNtMsNJre4ry/RTAjGnXFwQxG/yXmRbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MehId1me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yz64demN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HIO2QZ1944069
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 00:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MDILxvRtKcp720/UrtSTDBg6
	/HJjHwoeZ4/0fsSNcL8=; b=MehId1mePzlN7KBHLwUFoqLPqxbNclcPWhxpiS+G
	b9tLOO2g9J2tgOZRUMgO6xTrVYrwCZLBu0r8+nynHO/1wk3YTqvtONu++sB/WfCz
	KhVY0YHBJPcf7txj+z5UyzxUPSUqEUtsEwSqNKSlyFs7eCwc9SYa2xdX2yd0rn0u
	um8w4X/VLXxX/go52+7FUFYnkdYsySY57k8xBmLhhLIC4wUfI1Mzuu8U3skBr1iI
	qWWZZwULTsUfiUCnokC6E5P1z+epF+N3JoZBLs+4uXn/SxpgxhZh70YubHahkRYg
	arwVbGom30ZUJ5ZYmOdEhG/Ly2FoZF2KDxj7e08BR99JxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g2g4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 00:44:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso4742282185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 16:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771375494; x=1771980294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDILxvRtKcp720/UrtSTDBg6/HJjHwoeZ4/0fsSNcL8=;
        b=Yz64demNCru+oT/goPjD2AvQrNq1OqWql7djJ6tewQHpHXBnrCsrjo5m4NLkEjxZUI
         cNSR6HVyfpeVv3dNQV4A02viLq0BH7w6+LK8uIa4x6aWKDb83kxUkwJcQ2B1mwEVEIHQ
         yNvqKSHkawZ69FZv+Lh8oDS0czDoKIWmueDMyTRbJA1/JUD94Xaq6iJVTFseTlepCBgy
         1JAz+fT8xdTL90Aetd5qI7XIrKaO5BazLYb5NI2XiNurRII2gbtVIg6NIzZDbxj5LePV
         NMJETQklDQNTPcIUY4yRRF48ybwFu3ndPkqcddBymZVLbYurh1ZttqDeHAAClDIQGc0q
         mbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771375494; x=1771980294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDILxvRtKcp720/UrtSTDBg6/HJjHwoeZ4/0fsSNcL8=;
        b=JPW+SjJMD80JjjuqP4VIL5+cFqgX4TwNXuXgXD74uPmIeiMJp5URW6/aBnS9Rb0Xka
         PCk4NdEvVqasSAQpRpSyNSUr2cq9KE68owmTWsh40Mhd/wzb14O/hy/ZNyoKBgsRZyjj
         GsKiBegM3vdTj/inxoCWEncZGhXsThpF77OyGZOEQ6r5Nc6LhGCcucKY2pe/HvBUsoXN
         LLEU0X5AVK/+Ejes1OAeeuTr07xDkOBB2cpdbUBw03tEeH1k2dlR8BWehNEH7GqNGVEQ
         eXEWDs8zHLhiJm/SwrbBKbXxmnQxgI5C0Qcm8F1G+F89R3EAklntprG0cGndKFVaiOBQ
         qd2g==
X-Forwarded-Encrypted: i=1; AJvYcCXKG1D3ZfSje0zxqPvI8wthAxlhemtW0ajoREO0u8E+UmpLXTtmssEclQh5FkazecTBi2W2zyAL4cO/t004@vger.kernel.org
X-Gm-Message-State: AOJu0YyKWviIzSfsYcTvkLC8bwztD9Fc5pka7CWi+awgugOOaCnTJs+9
	YzvD2NV9zon2ZQFkVtWjxRzJorKO+j8fjU0NKcwf5uIm1GT+r021k/pK/oAvbdnevB4VOUZ/T+U
	JkADfPKGbxzIkxeIX3fXcmKAsO6yY/KkCFRMelJGzLMTlDpxdb2leSpszkpbo5IJ6I1cM
X-Gm-Gg: AZuq6aJKQXwzA1Qlod+C6UWNlBRDtBZxTNi1EVkuPdzfLR/0WSqDkj1vrb6pX0tuz58
	s0fy1N90Ms/Vg8zqXnChybyEWTmLm9mkh8wMVnQF05mfEPBPCacTGyXrQ3/mjRHj+OamkfKurGZ
	QPgx0jC0xp62LMJQp2WYUXznW4lhtS5khLrGQ6BVH8oHKK1CcMtpcYkouvjaKDO7+mesAjdzw12
	WSCWr5YVK00aEkE6m9Mq1Ag2+CuJmpHfCMjbObqV/MTXL4rHg0LRSSrb/Jn84UpjTgjONLB2R1B
	83oSpwYBoybUESj3hzukE4psUDvO80hk758vYXb5DRurWQ2Wg3OO9+MNfPfnhi/ESjUgFAn6hd8
	9GphGWf1X2rSu9Ah5ei14AyzquM/h7IuwE3vIG7VZ7jsnbOYBPLLoRSmRaihH+iOVgRQlSjkbME
	c4MTdZi02QeyxEZxa1CuncqjktjwEW1cCaP/o=
X-Received: by 2002:a05:620a:4607:b0:8c7:176b:ebbe with SMTP id af79cd13be357-8cb4c014765mr1607894285a.57.1771375494355;
        Tue, 17 Feb 2026 16:44:54 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:8c7:176b:ebbe with SMTP id af79cd13be357-8cb4c014765mr1607890785a.57.1771375493872;
        Tue, 17 Feb 2026 16:44:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5976sm40285091fa.27.2026.02.17.16.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 16:44:52 -0800 (PST)
Date: Wed, 18 Feb 2026 02:44:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
Message-ID: <pl7gyocwutgt4ftfjql7ipmsvvsje3jkzi62gnostcxartcb5d@trrdjswrldnv>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
 <5dd7834b-2e9c-4865-af6f-c362aa0c8287@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd7834b-2e9c-4865-af6f-c362aa0c8287@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDAwNCBTYWx0ZWRfXx+SZLvia+rKo
 BC5VRaBjkcq1BXbl5vmE2P53nmZ8cV9E6dz1Y9INSPzcOKIy4nheBf21AMbLzs17slBfDGOnP+g
 fzlWR7d/27/iKj5tZHt9gONw0rxjcwqPfobny9E1MYh60RVdSveZ80kFGApmps96t/gDwdLU/i4
 eqfXh0TatrC8mr+QyjP590utaSxvnU72xfLuzXAfc2dxPiJu/3Z8eD7TQHzMH4LrQrm3/GdUSFZ
 mRLo2VTdwEhMsDugS+yVnhxG3ZE4hu1RFDKQuQJH7cdVl3tD6o2bGAFNIl79XmDBYSaLWAiJqnb
 HXzXigTlb32tvQ7RSOh93iQHuhAB+jhn7/QDwIQgbxTWfc04SqmqISXfG7OK9k/IAbIYkX4QPFz
 4WCoD0jUn4eZqL5Xd3o9hS2zAnA/dVSfH9O91+++PLqqQSZYWu7pCqKSG8pZu+Sbka6aCBucOTy
 wz9ygraux693rR8X/sg==
X-Proofpoint-ORIG-GUID: NvHMNOhCYg1gk-O6YYWvJN7HNUy5QPLB
X-Proofpoint-GUID: NvHMNOhCYg1gk-O6YYWvJN7HNUy5QPLB
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=69950b86 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=UiVfME4oCffaLAUF7oQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93242-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53F521525FD
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:55:41AM +0100, Konrad Dybcio wrote:
> On 1/25/26 12:30 PM, Dmitry Baryshkov wrote:
> > Currently the database stores macrotile_mode in the data. However it
> > can be derived from the rest of the data: it should be used for UBWC
> > encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).
> > 
> > The ubwc_bank_spread field seems to be based on the impreside data we
> > had for the MDSS and DPU programming. In some cases UBWC engine inside
> > the display controller doesn't need to program it, although bank spread
> > is to be enabled.
> > 
> > Bank swizzle is also currently stored as is, but it is almost standard
> > (banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
> > being Lemans (it uses only bank 3).
> > 
> > Add helpers returning values from the config for now. They will be
> > rewritten later, in a separate series, but having the helper now
> > simplifies refacroring the code later.
> > 
> > Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index 5bdeca18d54d..f5d0e2341261 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
> >  		 cfg->ubwc_dec_version == UBWC_3_0);
> >  }
> >  
> > +static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
> 
> Should we rename this to something like "qcom_ubwc_macrotile_mode_8ch()"?

I'd rather land it as is (and maybe add a comment).

> 
> Konrad

-- 
With best wishes
Dmitry

