Return-Path: <linux-arm-msm+bounces-65725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE83B0AEDF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 10:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 712FC7B5DF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 08:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D2E2367C5;
	Sat, 19 Jul 2025 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aumUsjPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D9E881E
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752914586; cv=none; b=TfQr0Zgph6SuiynWsIeWxm6kdIwIiD2yTE/ajjJViQNsfuvqCqB6HMIWYPU5MeOeiMZ7AYxj6qnqQSFmSsUMXTuAfYRV9XMaB5zqV4PV/vDwO+Q0TEpctqxaTH+0eVIt+YIbtChIumY5EFuEKy2iafaDiYfiYQO/7s9tHCmsWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752914586; c=relaxed/simple;
	bh=7iN9/WrBKY25iKx+cwZ+YxYqzk4F14RrKVxydDAyfcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmRtQDMF/BFGATmP9/y+TS9Az+1MR1E4NIn6BDhf4Q25SgKgVliArQG4e1GPSg6BsIp96NxPF0Ml6s2Z9zlGJvqmoaIC0Arp4vFKxzRadY/sCXVbmhuNF/mhljq8bpr0FSUKPDfnhQZHdxtk+LPTHqrOQTkY3cmU0jwrZBTLXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aumUsjPS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4M63E016355
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 08:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+hnvC71NGCDaTEDlHwH2F+79
	X5DpGLt8T8Ke/VwrdV4=; b=aumUsjPSYsYh7JHM04fduprz9eo9a/rcbnLWUMAh
	UABO04GkBiQfvJwEk9tjuTfhFZBc3o+qt6/SrO7+Crsmah+B3r3vX4bYgphCLqBk
	BZqBZIUwuYCszGWq1l8UOhAMi2SPyyXji2okom/U2ZjBZbv85jliWQeF//r0xKp9
	/ZAMRMOWIb5j93TskW5eV0LYVaPbqxzrxore/6zgzPnYWzOch6HSVYJa3/se11bf
	dbqBLYVw9pZB4LycMoAhJDCY7q7HGIgd8i8MYh35Hg2cujtPCn9ImbzSLfdF1wNd
	mw3xOtFMFCb41izcypdp44OrmSYXiTraqLmkCruYNccDFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048t8bed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 08:43:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e338e627f1so772909685a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 01:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752914582; x=1753519382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hnvC71NGCDaTEDlHwH2F+79X5DpGLt8T8Ke/VwrdV4=;
        b=RjT35SVTzhEa+UfUSP5tqAM3DiDWRkqu3IVUEXZSIxkNmot4sbny52tzd5EPQbTbg4
         t7liMWXYgjI2kjOHxzKKMzkiM2zY5NIloLcPF2TCcrjVL3tenatpBXndsTEv+ZJaHL3+
         ShnUKYLFyuwwQMRCOukkt98Cd6bG9vAnJ9xvP1XhPZ9+/4Q7FFg0ZDmfOTZWTqHPjySK
         ZjBHW4RIFULR9qsHJme1HYSnzuA5o8iHCIygg3ltqDcW46ZGX8vG1b8u5mNMKoZbIdBC
         +Tiy663yr32oI90QRXEyshPs+GJj1rW1CpHY1JH12QOeBSmdQeUw5FkQ52Nv9rUYl4HB
         JBvg==
X-Forwarded-Encrypted: i=1; AJvYcCWp7gi5vHsy/cfRuWa5oH1OUSekmpAntKNn4jmJRvzvDB6DOAoPAWMcSSQSKd8LY4JIAOoTT4WV1ED4xz4e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2l2uaItvCsCvS1bFruHXKNtrdKURvHR52mORwJqvJYQCM7tdM
	pLjWy45kFOdMMRp4oQuLWXPCMsZOuMD1MQ/rk9Y8Kyew+4yr5+eyXFkr9c5Ll6eQTjiAT0DiI71
	XH/YVX2v/UaivuVpSWz+sTXJRHuPafsM13UKtDdEfjwEUEjZwszmw4YYxPm2INAzukt9n
X-Gm-Gg: ASbGncsgrvWo1G9/lgU2939vWGPc1tTN7IsJaS+8BP3WHLuZWgHupof3oOOSRJo7fZe
	xy//lC6L0WHsC7tfmzMklLbTc49zX/eI4hnNM0XKz+nSd0oELt5zdK85NUoegU1kx/y4ORl8hPO
	Kv9j1QPDltSfk/uFKdokhJxPcQrx7f3pOlTRk0kwOS9TobJQU6p0AiLoPELmSw7X8DUO+JhxmVK
	JDKGqzYam2szButWC5YX/A3ADdHaTKE5WXbyemoZM8K5FNZAe2HgeeozHxOiLZ6wdwvYImHu9cy
	DMGlinBXZeTxDKbbN7DLl5tO0hgTJ1qO1TWiFK17hAzs2G+7vLWjpbT5BRaMNmdPuczuEKoKuOV
	SsuahO6juVh6QfgIIiAhjWrJKNlipQIAcmZ4nmc/Cp/FwJ4pqxkBp
X-Received: by 2002:a05:620a:1909:b0:7d4:38f:a7b3 with SMTP id af79cd13be357-7e356ae1a00mr764032685a.29.1752914582254;
        Sat, 19 Jul 2025 01:43:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaL23hIhZB17M6H1XzM5tH6etKFp/euLYf8xiH9hxUCYpIqAx2BG9Fx6g8LCbtyU3x+HRyKw==
X-Received: by 2002:a05:620a:1909:b0:7d4:38f:a7b3 with SMTP id af79cd13be357-7e356ae1a00mr764029885a.29.1752914581761;
        Sat, 19 Jul 2025 01:43:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d911c9sm623429e87.147.2025.07.19.01.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:43:00 -0700 (PDT)
Date: Sat, 19 Jul 2025 11:42:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
Message-ID: <fmehneccbfrtvr332o3z5qo4wduha4i32c3lf5vixcbskeioll@7ax7pupvdcnt>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
 <unwinuwoft6sfczcjlqq5kijss3ttggfbobs6ydw5c2lkmndc6@7c23jntiprob>
 <1b385a59-5461-4c28-855e-d2379c2a8173@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b385a59-5461-4c28-855e-d2379c2a8173@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4NiBTYWx0ZWRfX5KDC+ecnnEOY
 yGDNtvdleTXjpgFYckPrFH6Ie+JjvKGiBNPl9uS9DlkUnuWXxc7zdIaPXdxWE6QH1epZN7DKUMH
 ivmqUXyiHwRLr8DkyvOm2HlaHRKs7BqYFsIfac810IwfnXLWmmEoAT6eoq3UpHrouZBwH+qoHnq
 yGXszU5rVbCWA38oaUnZV3ReXcfwrnEWqOK0WONwa7G+OE1NNJgpJUaBmzr2PBUcMENeXrzd72u
 4Fd4Ikyb2q3hddDJ3WYpvCPgOhS3j19zw7tBhQez+lcJZEcnWo5enOp3uyrcJwbM16oDNv83v/x
 pr+Uxf0bN9SVfO/wWA6Nz3G7C6Zzd8y5VQK424QTPG2kkEXKYNgK8XJ1MtMlwVxWHMQP18ovv6n
 Dh15UYbe0anZUWcjGLEVI+Xz9jQAoc/BZdaaxXLrcWy/eKsPqghYTrWn9QE+t30kHru3hvSm
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687b5a97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cjBuAn5bJLGjDEKm4m4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: flpRYhiGbKm5PAVtsjOPpdXIBGG3NEsX
X-Proofpoint-ORIG-GUID: flpRYhiGbKm5PAVtsjOPpdXIBGG3NEsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190086

On Fri, Jul 18, 2025 at 05:16:56PM -0700, Jessica Zhang wrote:
> 
> 
> On 7/18/2025 2:13 AM, Dmitry Baryshkov wrote:
> > On Thu, Jul 17, 2025 at 04:28:43PM -0700, Jessica Zhang wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > 
> > Please fix the patch subject.
> 
> Hi Dmitry,
> 
> Ack.
> 
> > 
> > > 
> > > Add x1e80100 to the dp-controller bindings, fix the
> > > displayport-controller reg bindings, and drop
> > > assigned-clock-parents/assigned-clocks
> > 
> > Why?
> 
> IIRC issues with the x1e80100 dp-controller bindings (i.e. the reg bindings)
> weren't being picked up by dtschema because the x1e80100-dp compatible
> string wasn't in dp-controller.yaml.
> 
> I can add this to the commit msg after moving the
> assigned-clocks/clock-parents change to patch 3.

Just explain, _why_ you are performing the change, not what is being
done (this can be understood from the patch itself).

> 
> > 
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/display/msm/dp-controller.yaml    |  2 ++
> > >   .../bindings/display/msm/qcom,x1e80100-mdss.yaml          | 15 +++++----------
> > 
> > Split into two commits.
> 
> Would it be better if I kept the compatible/reg bindings fix in this commit
> then squashed the assigned-clocks/clock-parents change with patch 3?

That depends. If these chunks are required to fix warnings / errors
after adding compat string, then keep them in this patch. If not, split
them to other patches.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > >   2 files changed, 7 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index 9923b065323b..4676aa8db2f4 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -29,6 +29,8 @@ properties:
> > >             - qcom,sdm845-dp
> > >             - qcom,sm8350-dp
> > >             - qcom,sm8650-dp
> > > +          - qcom,x1e80100-dp
> > > +
> > >         - items:
> > >             - enum:
> > >                 - qcom,sar2130p-dp
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> > > index 3b01a0e47333..0e699de684c8 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> > > @@ -170,11 +170,11 @@ examples:
> > >           displayport-controller@ae90000 {
> > >               compatible = "qcom,x1e80100-dp";
> > > -            reg = <0 0xae90000 0 0x200>,
> > > -                  <0 0xae90200 0 0x200>,
> > > -                  <0 0xae90400 0 0x600>,
> > > -                  <0 0xae91000 0 0x400>,
> > > -                  <0 0xae91400 0 0x400>;
> > > +            reg = <0xae90000 0x200>,
> > > +                  <0xae90200 0x200>,
> > > +                  <0xae90400 0x600>,
> > > +                  <0xae91000 0x400>,
> > > +                  <0xae91400 0x400>;
> > >               interrupt-parent = <&mdss>;
> > >               interrupts = <12>;
> > > @@ -189,11 +189,6 @@ examples:
> > >                       "ctrl_link_iface",
> > >                       "stream_pixel";
> > > -            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> > > -                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
> > > -            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> > > -                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> > > -
> > >               operating-points-v2 = <&mdss_dp0_opp_table>;
> > >               power-domains = <&rpmhpd RPMHPD_MMCX>;
> > > 
> > > -- 
> > > 2.50.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

