Return-Path: <linux-arm-msm+bounces-77009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D5BBD3043
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 043513A37EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BEF253F3A;
	Mon, 13 Oct 2025 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Palj9H/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F36023F431
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359074; cv=none; b=tyxwPWogVcV76tdKknnm+qP5ez6ePi9Ej1fqozyFk4X7ncnIbq8CjUeKD37CT7NBLMu3vovBwKGeJaZuUDXG2FUySOE69848NwDt3GGF0rCVWNFuezkOs+9A7tUQ02nj+3YPPXY505X2PteD+YFvuHt3beobV3t7wOPJmxRxeo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359074; c=relaxed/simple;
	bh=aZGRCaEQAskD8nIjNVaot/fSIqSTel0rYFtYU6crRRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLMozoZBIzivxyhZQw05cP7vny9KldxKEkZGPWF7J1H1VIZqiAz5HvqHeAO7Kwdv6VUd6gdAqMJcxtNcjejnPxSJ5RTG1gURNPJl/A5NeuiI+w38lt8156UdK9TQhoMMIF2ljw6NPDocqpx7MNEEbn6McoAbuSUa4rOV3k86NyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Palj9H/Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAgeao024542
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UTXiDHZxjE5lYanBLZzc3WtP
	FhwD6zEyaiJPl3VCc+c=; b=Palj9H/ZHdSeQ9v8BmEGpcpToPtdkFkW8L9foVqF
	ma0Q1ih6Vl4BSwmHNHJip8SFxWjaPUnPkijbB4VH1suCrIPjty4Yc84bssgGeMkz
	YlcM7rGi7pTcoviN/WtNMDuncdFFQxwPk2wXEBMC2ddryPuWkzM/LoaqKh1gZds+
	Txq97tHGJjSZ4ihmFmyr+fYQUucuLypOmod2sd4WiKuelVCEp5Iyje9EZmhFaDsJ
	kREEkvjwGMCOFsY0eqoBnH0uZ3NvHxfrtABxbZozsX7wIGrFq8zrtlZet1NUdQWF
	3WoD985IMAHdfy6W+Br7NDrmgdCYGfBoBF8QKOC2Gwighg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa84jsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:37:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-871614ad3efso2175445685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760359070; x=1760963870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTXiDHZxjE5lYanBLZzc3WtPFhwD6zEyaiJPl3VCc+c=;
        b=s06KFixWXAbLvhRTzOehSXG07M+zbl9QZJrBWzh5yvMYRlg5hyx9GVk1VBdqsnJhOy
         z920J+n/aWNL+/ewK4MCeD5OcjUgkt52uugqSx2klJQ8ilfGzUqSUAl4mD8T449ZERvY
         Tzwsyz5wNsavophuLBod9Y1HBJFT39LpAbTJ9G3AeuTHl05WBz0y/OpAGWdVuABnJV4P
         NTBGJZh8di8bTwk9xZ8MBxMs/zEs1JlaI0YSGrEhg5oQGT5q4FRDvVT7222ZTn5aZPn6
         mUVoV+Cij/QMpYfFeHt4ztfwggKatGU4mCqMKMsqNvm3Vz5D5JpoV2Nkv0n0oimk4tbp
         319g==
X-Forwarded-Encrypted: i=1; AJvYcCWLuQCTPkg6cXfGs9oOih0AvFiyOk8yCciQDd02gLFlQopCnjPh4oRXrZc/Qic/6W4khsTTz4eMLbTaVkom@vger.kernel.org
X-Gm-Message-State: AOJu0YyeCOqfQp1tugedpW6STz1+RMf/hZT240hnMbINb6ouOnUtObds
	S7PeJXX3L6TejrwzlMituzutbStvQmq4zcF2suudPuCg6jKGpm103ACMnscIB3L2Dj0FqWk+3+D
	PAdM28XR1OOyM0x3VnBXhJqGRKIXtiRy3wO+k3e4PFA1aO55a7U0FY4KT2ETodmeGt7GX
X-Gm-Gg: ASbGncvaxymGL34xH+L2Uvcl/fB2nOqOMI2siyhsdTF4Wwp584SPx/GPHWyVdhsBc4t
	FUPDgPMcLAuTJVCjbteAIcaFMZSljCCKbEt1m/ZiW+hB084zgC+ySk3Ma+SldG1EYQqTgRj5e/y
	U7rIfIYM8v0cTbJQ/KBuE3yElUXfqtly0LHBiAbBIWji+XJDkeatpf28RIFueRhuS7uYPGCS58O
	njH30D4hPNUMe93wZTV7njEw8y4slcBLZAZ5WxAPB1ziFOK+DJRQvgx59TTGXvH1Yt3dj761iAW
	hkEtDSkdB4ofhfylXObTF1kc3Dznp2zNdkuB0s+JhA3bGFsvtXZIXx/GCLzD7maUNwgA5PLuk7y
	09w9YRJqKmocOSkEKA3zldrl0CzMLhkI2IW3WNkkmOZe1AFif33hw
X-Received: by 2002:a05:622a:189f:b0:4e7:28c4:3367 with SMTP id d75a77b69052e-4e728c43476mr38351511cf.82.1760359070237;
        Mon, 13 Oct 2025 05:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWOjldqO3QYpUkgEWR+chHtoaSrhdJCEvdufVafxS4s9vy3NHcZihffXxkbgVUGrgtKFOT7Q==
X-Received: by 2002:a05:622a:189f:b0:4e7:28c4:3367 with SMTP id d75a77b69052e-4e728c43476mr38351181cf.82.1760359069747;
        Mon, 13 Oct 2025 05:37:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908857792dsm4079248e87.105.2025.10.13.05.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:37:48 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:37:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, mani@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        vkoul@kernel.org, kishon@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Message-ID: <xofvrsdi2s37qefp2fr6av67c5nokvlw3jm6w3nznphm3x223f@yyatwo5cur6u>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-2-quic_riteshk@quicinc.com>
X-Proofpoint-GUID: WZXDZAsmxEbXlmfHWJF3q5TRjEUxOOqE
X-Proofpoint-ORIG-GUID: WZXDZAsmxEbXlmfHWJF3q5TRjEUxOOqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXyHWcVwu1PM5g
 EMUcD5GIFt2ylYeGbOzShBLDD8tzvTZHoOENB/OUUEzCCxIS9G19NIa8kCzLyP7jpAGkLzt+JZG
 1YB5k9PGhuv1+f5sCuNux40ncJFzgFnvX3A0IJ75t08LpP0GZRb9BBrK39b3e6iDm7YiD7BB5pz
 uiRjBkUqkxaHN138qkWmCe1T8kIl2ip52RbBEyLAzJL2Xn44oGEgOfaJHbOLn7cryeeaSa2vy7Q
 7dlQr+78nXAIhXXQGTE0djMVTbF46KFbxdg/MyrXVhqSmovqkf03AGGLJ9UrHuvI6Jxzqbx0PO2
 sY1zmpj9flhV6mxGzHAWhgK5qu31XXUiGr/UIa/PKYSvrVCb/Itdv0FuYQU+TXhSD0tF83dL+Vm
 pRLsC3YwT8cAg56qCsZPFxIp/GXF9w==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ecf29f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=1RwfRIOwSLSNpsoXFEwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> Add edp reference clock for sa8775p edp phy.

eDP, PHY.

I'd probably ask to squash both DT binding patches together, but this
might cause cross-subsystem merge issues. I'll leave this to DT
maintainers discretion, whether to require a non-warning-adding patch or
two patches with warnings in the middle of the series.

> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index bfc4d75f50ff..b0e4015596de 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -73,6 +73,7 @@ allOf:
>          compatible:
>            enum:
>              - qcom,x1e80100-dp-phy
> +            - qcom,sa8775p-edp-phy
>      then:
>        properties:
>          clocks:
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

