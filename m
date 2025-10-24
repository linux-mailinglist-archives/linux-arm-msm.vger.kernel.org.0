Return-Path: <linux-arm-msm+bounces-78679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA8C0471E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 906EF4E225F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 06:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A87242D95;
	Fri, 24 Oct 2025 06:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEEy5YYW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE0241696
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 06:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286135; cv=none; b=eCNcFL+JyPAgbDu9YyRX0oRK8MyVCKeNI7TPG0VJgSNzLvAMQLbJrMQMpJnIgaPklhADDRnKfBajjyBOYuq8K6IxLLMRY0SmIUAgLN1HsD7EJjHQBKssknarl/e7joc12mevyWIGrMdJSeNtbKi/zpc9CFMs854jGLaAd8Xuhp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286135; c=relaxed/simple;
	bh=k/yqgXIND7kabul+nluZrnak8Yt8KlfUOJNkzs0UD/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=su6WGUnuy113bZn0hZcr71s0iTwTCPZ3TEolqSl3HQ2hCHxHlb12IME1ip+SgZf6CGLG+LRjXuymyrZvhErtsOcfz4apwiZEOtpMEOlXOfkMM3fMHHPyDgM7bNBkO5Xp+p97HvIcSBnaa+NrayuVinZu+KcIRuoG+KKpx04s8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEEy5YYW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3M6np010211
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 06:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5paQZUXoZhbSMdqEbr7oDMWv
	5wYg/eSHa84AvpMQ1gU=; b=KEEy5YYWmGISqZocseXqFvvaaUAPB1sOLO3rqjvo
	KU2JgAV8n6Joarvt+LHc7yBgdWDf0m7m+vEWqORLJf1frTF3vDqE8P5zeMk/5X/w
	HQVRqFAwnYc5vNQES9Iqf8gMP8C4QU2evE0EBL5HaP/16cECqMGIZfh7QDBs5C9z
	wkIDgrgKOtaiBmghZxCT4Z0Ka6NJDAK64YoX5D+4QB01Opv4APoRwOxGU7wFlQyV
	+VZElCAflFA3Qf7Rdn76yUIjBSREdea05oxzw4vYWrOBwkCuKKYCFFCBanWJSVxg
	35BlkTKW8mlwQcLetyJFcvBpWL/ec7QZzMZduNclkrT8Bw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524d61u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 06:08:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c171369aaso53399896d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 23:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761286132; x=1761890932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5paQZUXoZhbSMdqEbr7oDMWv5wYg/eSHa84AvpMQ1gU=;
        b=EntT4e1373MpJMKNkWoW8S7l6t6ZmtzMV8+ZHGNB9WjYTxL5ro2ZY5VTHC+f47p6vn
         kv3vTYpxWk1vVgAWHBylhZw/2Y0GLM5U2assGL8K1FbOU2y3DeyvwjAEf9fzg9qaorAf
         Zif9bTSvLTb/h8Y/tvsCQvgYm/BmxIZSOV3OaMU/mMAswPkCQplj7FgAJIEy8UAi+jwm
         Gh8DfP7INwqOOVHVAL0NfkZK6YQqoaVAsSaLYUXqeq/aNgBUxIZKiLNPJpmshHMkUTxt
         OjijHvYSB6uNNNwl3ZJB0EhVhCXY+MrhIc3WAFbn1lLCGkRZEiimgcRxdwM+4ZzsbQDr
         6f4g==
X-Forwarded-Encrypted: i=1; AJvYcCVBqXf2XmxdAVmj/bsZKBEVjl+ceH7W9hrcwDltpTq2BokrEQ8/0MKKBbJCFGCldYXsp9uzk+ZgRFNLgjyT@vger.kernel.org
X-Gm-Message-State: AOJu0YxxDiP9OS/DTYYrL9dOC38hK5rBV548x6liBtDeBfIxaWAchoqW
	V1Gy7eMa8doMfdWV/H9SHoWmYu8EXoAajbNUtcw5G8AMedow7LEphEIG2EamInwhBMJD/9V7WpV
	yJXSI4FGE74tEvErapWC1yYF8KGA3sXJ1OdHWAtgMZ14tzTiC14+pzjcxzxAVJ76jL4aR
X-Gm-Gg: ASbGncvcuOZyl5wK1Oq5kprpKQmZ2EFFB/iiy84OMbLiUVNnEs7yjC9EBvmysoodgES
	PMXInDEcWsXNscqP9GtIP8Vi/4FL2ZzW9SASplf9ybyES6IE0IlgXXzdiXGauJCGbhRPE+ulfCh
	4KzVd/oz1H+gRRuwpVxqJGd6K8tLLEUWue0A5cPskYL0LBy0l0I2ec6WOCMCfEJNFFxPa3HLSWE
	vWH4biUQYXRDU8gS9SYpyH7wpzfI/XSt7bgpafkUgHjzPGXty/Hq8wvNXiMLwhRtqlZtXtyxOfj
	TcJNEP1pqnpk3awxmFTWuDMMSU8an7OWU/UPYbz5fwGbgGGx/5Je9rvSNrM0989mcdXGXnLYcmJ
	gAFeXHtagbwqdU6rBGnsdKYYT4RdvKmA6pO5UVQ/A07by1CRHzmpwYdKImGb8
X-Received: by 2002:a05:6214:762:b0:78e:2582:fe4 with SMTP id 6a1803df08f44-87fb41405f1mr18971166d6.30.1761286132404;
        Thu, 23 Oct 2025 23:08:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJfims6BmldfbNUzzEmlDV12NK3CNrXycYwMc9WdMoAhC7GnzxeZrG4DxKcu5+ArENqYaIDQ==
X-Received: by 2002:a05:6214:762:b0:78e:2582:fe4 with SMTP id 6a1803df08f44-87fb41405f1mr18970886d6.30.1761286131954;
        Thu, 23 Oct 2025 23:08:51 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f9e7f52e1sm29575846d6.51.2025.10.23.23.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 23:08:51 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:08:40 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 11/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Message-ID: <aPsX6Fh0tiGuUox6@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
 <binhwh2sb72ipt2qhqdmnid2hygdnjx62mhzn2cl4v2do467gz@wkmsvroshkcu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <binhwh2sb72ipt2qhqdmnid2hygdnjx62mhzn2cl4v2do467gz@wkmsvroshkcu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX4oPFMc9OtKuj
 ER5U4LZfWVS4YbuzsaGqLSUt7lCByM7mLJ+VOA2CTPbH6sh881saY4Nz7pNlVNpLaSx29MBUyoT
 iwD2Q6czu/wsWf7wnW6ISc/DdFf2WOhqD5EAqINIvk1if8uznX6eN/MK1vhiIi1xVLFoWQZcWWK
 KojMJO0gzOdAaR37USZvIh+Ny80Q5QYB+3mVEaVv09QoEdK6AQnLMfylYABA4jkLi7HSAEFSh5n
 vscjONZRiq/UjesSqjCGab3UP8/Lus/rAEKyG1vZNBa6mW2dnzrBNS/3/1UDAyDdbHjozKuELxp
 KXAaGo2WVSADFnrzNVGYz/S+XgTVCAqcXNXN91S2ZaHg0nCHr0o8T+FXwRZ3P6kIH1BJdCnOgpJ
 RIKCvK0hepCcw3Og/iQGNes5Z9VK3A==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fb17f5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WIVAG7BfrJY6p4e7JxwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ijjCplUEjYHwwsMOY6sCulALGtODHH7w
X-Proofpoint-ORIG-GUID: ijjCplUEjYHwwsMOY6sCulALGtODHH7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On Thu, Oct 23, 2025 at 03:16:11PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 04:06:08PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add DSI Controller for Kaanapali.
> 
> Please say something more important here. Why do we need new compatible
> for this platform, etc.

DSI Controller for Kaanapali have no significant diiference with previous version(SM8750).
But some register change make it imcompatible with previous version(SM8750).

I will give this reason in my next patch.

Thanks
Yuanjie.

 
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > index 4400d4cce072..536ebf331828 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > @@ -15,6 +15,7 @@ properties:
> >        - items:
> >            - enum:
> >                - qcom,apq8064-dsi-ctrl
> > +              - qcom,kaanapali-dsi-ctrl
> >                - qcom,msm8226-dsi-ctrl
> >                - qcom,msm8916-dsi-ctrl
> >                - qcom,msm8953-dsi-ctrl
> > @@ -369,6 +370,7 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - qcom,kaanapali-dsi-ctrl
> >                - qcom,sm8750-dsi-ctrl
> >      then:
> >        properties:
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

