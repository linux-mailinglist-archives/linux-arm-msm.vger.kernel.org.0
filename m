Return-Path: <linux-arm-msm+bounces-78591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F1C01143
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3348E548FA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596FB311C2F;
	Thu, 23 Oct 2025 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icgvQ3yD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16552494FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221803; cv=none; b=jE7RMiajhTvdRitPlbNp9bV9dSFUZ5yH8hGNBLPv7Nnjv7S0I8t5zK6ZEwM/nuZQ7+r8piPHZQOfzNCZn8YzNSh3TaVZU7YUtT13CCFlzAlNgFJRqg1GmKBd0BGptT1YqTgsmJXnjjvEWl0nf6MeT3d7EFnzBP3sTlBjlGb8SHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221803; c=relaxed/simple;
	bh=cZlyEkb7lExdBwh9PEejexhtDGyWrl4DgTZeGjaLI3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBLmzqtmT5Ph0XfNOeeMWAW0u0De3d/zx84Fh0mAkVrM2djAXRkTgSJuWvlJEbOfDev2XXVKVKJo0OpRcaO6OvfJcpV+37/xrxA8VKkgoWgk8d31gkODHQfwSXWFQTy3B5Ebq+sQGDsDK6uatnIoHoaD3zyNX8x5KaqgblySeHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icgvQ3yD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6tSpo022437
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4e4CsJ2qxbzcJTqFCSRdFwah
	q7xIbkuDSSw+M5pcQjk=; b=icgvQ3yDf93btZBjpIalqoLkmXnQ2pDi+Q1TVXRV
	539dPkpkFQMTkL4CilRdyArqe01KPg9kus6yPMaAgoU3BiOF1+UFPgTDUAj4PIIa
	b2278e6v35mn4pjjNchMDN5jUA73hHKhSxWMzox+hikwZ92oCwKbZLyXv8NccOX3
	Bmmpo7vFtSIHlmP7tNvqBMQpKJVH1EDTr+r7qU1Zgyfa9ug1a/81EAXYwm2lSLoL
	iAhIfY0qmYsMuS/e+9EXPHTOgLYRT0cFPKXIbFvMVGRHDOcpfhjBK9Jk/ZtlC4ti
	mbqEJbViiZq5MStIvSRkigVtkz4XqYINo3Lp+ijOhT46oQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w88bcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:16:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e89ed6e110so20468071cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221794; x=1761826594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4e4CsJ2qxbzcJTqFCSRdFwahq7xIbkuDSSw+M5pcQjk=;
        b=P82ACAtW5jAc7K7xyn9WE7TLPaGgu6gkXaeiZwyvakNAuSiF2eHKN0YnOSPsteG/FV
         KcQOhbO5Vmq/m+KNoLUxSjVyqXttH6MJxLOX1YRFsfRm92va8yF4yFecRF1AlAkERS9K
         4Agd1gabFg5WHmzWorVcNow9qi06kMHDu04XkwIthR5wzeqz8NTvncJ4zy535At+geum
         PQhUcjsAkbonmRbApHFqoA+Y7LslvyiOnQGKJ6d6PlIPcTLwZGzWgskyxgqLCEMzPnEu
         KEQrwGjaWXGRGx1GRBJK75p3kUNXU1b78wQ4ePoPDxZQomOIQnnaRnUsZcgCrFxItyPK
         sT6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0lO4i/3YSQgT5qWwffwHF+twkHRCi4a+WRyxd/Wl5K7jgyW5NX9ijZv5lTvacL3MuHf70jjFo0dV5Deg0@vger.kernel.org
X-Gm-Message-State: AOJu0YxTC2krr7be9keE0OuIs3o+E9EedHO8sJHgr/OEF4su3EJvaxgh
	eI/ynMu1TpphIrrI4G9NwfFFgHpyWNGanRgl9jarue/pbQNuTL+ni5/iA9S7OaF+irS41VMxRD4
	cZJQXx9UmUio0Y7wuCpYh3CKGcO5tj76edXywixGr3b25D3S1k8IqrQLM/NQqx/z6kzGRJwJ8io
	Yu
X-Gm-Gg: ASbGncvI5NfhOLufG4G9igSaQOObpuJVI1hYfCojUH+GVGAz9PByjNLEFfe6LJLP552
	9T6kjXZamkJMy6N+1+n833XfDDnRR6RjDLN2HqeQ9NlwNRl1b9WnST4HxeH8dW5Z6F68zupXH2G
	4pTbilJRVreU69+TGJAJNTtB65wHcc8zUqjPxE6gnbyRs2QybLzOA9hoUzo42qUU2qS+aUmUdSt
	j4kSbYdZeeQZQgqhHus3h2FGuQ3CgyZtZYXBZ88TPJJo0VM5iB8wj4FApAtIUmrzqQcoj2tusxY
	Msbrc94qKihcAFe6+aHyYDWvkbg7cgW1Ylws4iWxeF8lpBCwbh1Dn648KbzzBL6VswNAoM6IZ2w
	8FL7cm2xMudu0Xsbc4ZE+jpm8cKiq9k5XEsn0Dy9z/THCfGX2gvh7zfJEaGN/tkPcME1zC9oHa1
	Y7nvrMO4MsK6or
X-Received: by 2002:ac8:5916:0:b0:4e8:a9ee:940d with SMTP id d75a77b69052e-4e8b6848072mr186108601cf.65.1761221794286;
        Thu, 23 Oct 2025 05:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGop9hpBDFFP1MrcMk2Fsq2TpD6+/75ykSiER9cOjUVWtI35/vGRfvOgaBCSCvXp2xBdGKtQ==
X-Received: by 2002:ac8:5916:0:b0:4e8:a9ee:940d with SMTP id d75a77b69052e-4e8b6848072mr186107931cf.65.1761221793683;
        Thu, 23 Oct 2025 05:16:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d38709sm678359e87.106.2025.10.23.05.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:16:32 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:16:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
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
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXyYDAJLUWOxNc
 h7aRcKJXnnG6bnb3js5CjVq3iJsQbQxHoOvZy2+mW1Sd3NB2PTMzPHhE678/QUAd7bPafQ9fpD8
 Ex3BGHuPCla9Ijgut8fWwQMyLvfaFuUfnrSpOa82EIIGDeaU5LgJVfMdoUol9aqx1lZt8f8nr4W
 Fyfta23G5i71vs25YCO15cQ0zJ63/g7VVj8w9PYqGub6iMRCM17Ckg2qROSxIkKYR56Wt3pMjah
 LKDCtPBIPElRVRW8JZxyQboPDni6yigqCQ+wbUR9uZHOiHYo7qE28xCqaJZD45w/sO6zmPS7Puj
 VipAXgS6aDhHpstrhCTG2rHAqMFzSGEQ7AvyQlVziIbXdaCaVr5cOZItDJosxndw4ITFsM3WVDv
 OcXkXtltEqDRlN9FlLVpvb1w885VGQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fa1ca5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=hdgSSxsrCpB_R1hBYGgA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: rQYmaRpCh5rvllm0jcOJuaD_XrGcjapr
X-Proofpoint-ORIG-GUID: rQYmaRpCh5rvllm0jcOJuaD_XrGcjapr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

In the subject: DSI, not DSi

> 
> Add DSI PHY for Kaanapali.

Why?

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index 1ca820a500b7..a6e044eed3df 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - qcom,dsi-phy-7nm
>        - qcom,dsi-phy-7nm-8150
> +      - qcom,kaanapali-dsi-phy-3nm
>        - qcom,sa8775p-dsi-phy-5nm
>        - qcom,sar2130p-dsi-phy-5nm
>        - qcom,sc7280-dsi-phy-7nm
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

