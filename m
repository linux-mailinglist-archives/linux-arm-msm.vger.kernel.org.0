Return-Path: <linux-arm-msm+bounces-85306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D545CC11D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 07:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 947923012744
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 06:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3B2344023;
	Tue, 16 Dec 2025 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNMP9DtO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CW27+4i1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5157932570F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866621; cv=none; b=f4bfor9GiHQmWIDQDRT9hnf0rCAD/kpMWHNaF0UwUMY3ybeBQTckpuKfsiJh+S7ml/mxaJK73KwhH1V1fHf78HeUcsCRZB1VOU7LdXjzjw6gQ5Ee+unaei4/RowoUFzWovShqPY+QnSXnU+c43SA9E9xDgnRLpiYM+6ewGbBl/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866621; c=relaxed/simple;
	bh=rRwq1ci3MREXWWcf3bayVIxAXAvrQv75ke5jZqTS4qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVA0zUgq5pIK56DCCQJEPj0CTGxPtkaVMN19gPUaAPCZzUxbSPAgWKp0S6uzU9PBq+2S71+qxV+pazUArJJBtSY/BWHmCNeK5Mn8Xp3t2xANfr5lL+FqSb+8bgQTf7+jyiJBxbJi5RzGcow7xKBNxLb6IGfAwC2OciSPxCsLsYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNMP9DtO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CW27+4i1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG46ZeC366950
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZOKoVU0nO8MaG0cbLAOwDYoo
	QPDcG7ORKxJsSltYtdI=; b=eNMP9DtO5xC1pnAdknWowTItD9/iL6uXQrNs6YJV
	zqfEb8DNDRPCC8IyWFZ+a56YLNaNhaZqwgD8+oZDZYbAeviU4AT8/h2m9HqigJ4d
	shxQesNTZPpiBM7JJxNlWNlDAQ1x7RAqBgzKkml8sZ/OGOj8AG09W69jXpBgnyWK
	f6Q0+n+nMwVy2idyqwGM97a4m8f8iyF9JUzcvplbQpNFMAEzaLuB8RPR4wt6dNxA
	VuZgEohVNjXbYS4CE7jF7BfXapoJtpQx6I0PY2HcjJviIKb8TQUJiTtARNmAOIL7
	YfkU6ovsCSsnVykvAOVSBrvj2gQpnHW0HyY6JSOFjDw2ZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2j1c3dr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:30:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e9b2608dso781174385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 22:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765866612; x=1766471412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOKoVU0nO8MaG0cbLAOwDYooQPDcG7ORKxJsSltYtdI=;
        b=CW27+4i1frQIvS9YWU0mMwLSDnDOFaoPaRClMOBNcWOVgI5WE/OTb63jxXJ8t2tVA8
         0042UD/3/P5XDJvCyz/CIBRDwtHiLkfDB7gtSR4c8fX/CS+cZyKtxt4hirGUlr1UN6gP
         wbac1TY+t6P+HExvwjlm7Io9QBL3aB++4eWD/79iLcM+a+tq+GZfmo+JVxB1dzdNXzzy
         Wy25TEv1wJJZNR8QyA3Tnx5BN30w7DATfeNa1ryVOEjp7iXnlmCHyBE04DzHraZgmN79
         5JDqgOn/CE2GXf5WEWcqJYFATQAb351XsM6FFNRGv1bJ9/szDQCAt5P5jPOHPmvWq9hB
         MdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765866612; x=1766471412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOKoVU0nO8MaG0cbLAOwDYooQPDcG7ORKxJsSltYtdI=;
        b=NukI13akmLA8hVqF1G+xOAkIbuB0nBPIFVYnuUQ7UKdFyzWGBWn0dsk29tLBsHhQ6b
         y+Yjhiz8qnUz0fnvGhFkiDnou5EFyKjXQA/IJu2kuMcBn1K85sQkb6hQTLRdJHqSEWpG
         g9ZQwKT/x052Ka0YGIRR+YmbjfTi1opaRHHMhkJSPttzZgaOcyFNe2DSNyZL6rKHmvCc
         up8jgKT0/TwHYPed95C8mfFdTsyJhJimLsaQ1Zcn33t7EfWSaSMIMQUms5h4FGmifnkj
         +A7RLhJAi6NkqlT5eB9CyY5DWmLNmsXyty5rRhMB6BTf8tFMnVR++6l2gbj0SlmbTATI
         TOYg==
X-Forwarded-Encrypted: i=1; AJvYcCXG7OiAvWErxRNRN4HkIm/qiZ7rGoV0CoCya++dWP/HFDQfdLw4XenUi3wONuAZYo82tTv0xmxxNL22/E+m@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0WvOYx1E9CoepfxDUPYfrvmW7UKgenORhHBvm1y91iImAda7n
	EgET47QHYuLUe4T/2PO0WfsmtsX0OT7eVV7RL066AXTSfMoystWXBEeXV36b7qaT2w0TAas7nHC
	pK2N7dwVGx7MoPWmL8pQqhqog4jVlFSB1jzzMOhZg9CuApR9mfwxSUQ7JhCQwig7vtz8N
X-Gm-Gg: AY/fxX68v4PQeTHzAv/nS/wUhWESRjSEyhNAwHe4XkjrEYwL0HKcPCGrGIWpbv8OYwz
	HGAkCeswPHgy4QVPsWeln7uFCMk1DVw6CAP/ZlDVqswlceowfr7Gy6JhxMaaTUEyDy3kX4EzBnE
	0VyENDTrAYlLEhpkiBqTEaHjIzFwSb1GpHB0WLLC5ghugwSQTbEtbmyQEq6jqwrB4xCf6P+99/q
	UJIgD5S29ZaDRFOwBAvXYlMJ7EQqxRyC2BbR8DJouMFIilLNNprKo4nfdwkl6p74kg3b9Gykr9F
	GbsEn0yZcdmxZlLzwCsUFipvYgfVsghfs7bZk8P+v8LlQmicjBVy6519G63BB+hJFT72/1kDX1r
	R4B2T4EFM1aiR/5fN3R/5BlqhKzvCoydQqhRomKwsP2jkzvzGBFrAKNTfAAWdJ0h8GMaV//g=
X-Received: by 2002:a05:620a:1a87:b0:8b2:db27:425e with SMTP id af79cd13be357-8bb3a2113camr1826051185a.50.1765866612066;
        Mon, 15 Dec 2025 22:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmgbzqVkC2sXrT+x0ZCW9D4FsdZmJkOPQHKCtJ3rLA4qYdqbCXcJCXegubktDtZajGh89Q/A==
X-Received: by 2002:a05:620a:1a87:b0:8b2:db27:425e with SMTP id af79cd13be357-8bb3a2113camr1826047885a.50.1765866611625;
        Mon, 15 Dec 2025 22:30:11 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be303e7e51sm131155585a.7.2025.12.15.22.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:30:11 -0800 (PST)
Date: Tue, 16 Dec 2025 14:30:00 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 05/11] drm/msm/mdss: Add support for Kaanapali
Message-ID: <aUD8aA/5J93KBZ8Q@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-6-yuanjie.yang@oss.qualcomm.com>
 <k7k7fpmlde4tjiqxhzbf67olcdzsfmctendyjeewwh6v2kkl3i@33t2qfjxhwdp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k7k7fpmlde4tjiqxhzbf67olcdzsfmctendyjeewwh6v2kkl3i@33t2qfjxhwdp>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1MSBTYWx0ZWRfX9YNkPTlfmIwg
 r5lrajq5LlV79rL9xEAAv9STyONwFVNIU+puP+KpZGrTwFlY1xP9Am14goYYnyCP636k6nOOh7c
 9JmT0AGVJCG8VibfW/LvUYPGFxxnSqnn8mOic7s9T26y2JxH8q4NkIjcgc/nJlxLIiL4HHJwKal
 FcRZixuYj0GA2PguP3SMv6lBlSzvWaMQkb497eith6IJpvdJK2oQdIhG+sDC9prIZmoO+FBwJ7w
 jRheTMrhjczR7PP/Usot0vzYbxtMQslihUbhQf2L62lAoKAob3OnBoeK17rO+yM9tJjN4z7x84G
 w5a2PgQNnFGC5wbmelPWZHZFLX47lZXjF+mF5Zff4jsiu31k8w/TyIDgfLukQTbmm7dV3D777D1
 /yPM6Br4NPUbX/+BZYrkgkeQByw8aQ==
X-Proofpoint-GUID: ugmW2LWj_u2vawru_D1h0cd7vhA-nmZw
X-Authority-Analysis: v=2.4 cv=ceLfb3DM c=1 sm=1 tr=0 ts=6940fc75 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K6Vp4ACmwqLtMlq4UooA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ugmW2LWj_u2vawru_D1h0cd7vhA-nmZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160051

On Mon, Dec 15, 2025 at 09:58:27PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 15, 2025 at 04:38:48PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add mdss support for the Qualcomm Kaanapali platform.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index bf9a33e925ac..cd330870a6fb 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
> >  
> >  	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> >  
> > -	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +	if (data->ubwc_dec_version == UBWC_5_0)
> 
> This is the _dec_50 function, you can't make UBWC_5_0 into a special
> case.
will fix.

Thanks,
Yuanjie
> > +		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +	else
> > +		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +
> >  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> >  }
> >  
> > @@ -296,6 +300,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >  	case UBWC_5_0:
> >  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
> >  		break;
> > +	case UBWC_6_0:
> > +		msm_mdss_setup_ubwc_dec_50(msm_mdss);
> > +		break;
> >  	default:
> >  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
> >  			msm_mdss->mdss_data->ubwc_dec_version);
> > @@ -552,6 +559,7 @@ static const struct msm_mdss_data data_153k6 = {
> >  };
> >  
> >  static const struct of_device_id mdss_dt_match[] = {
> > +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
> >  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
> >  	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
> >  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

