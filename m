Return-Path: <linux-arm-msm+bounces-72787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A18B4FE4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11C494E1BA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 13:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C746027AC4D;
	Tue,  9 Sep 2025 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmkohRjE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDBA343D94
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757425830; cv=none; b=JZUs044HCVTv/6NxYScOTPFWNtB8n2D9FZYNDXAsMVzU/DJqZ7scBaPf4nm/NfWadc08+JveDPIVGXMPwBflXvOKigSdiQkISjI0iztfoP+sVV4qe594cJMMLyVMIhxhhdD0G3BMjxGz8kc1CJTSii8yzUnLbAHZkx+4gcxL4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757425830; c=relaxed/simple;
	bh=hsZggDEeH8ea/RYTI72euQq5F/ES4plUX2WIsYwseKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jrl3ngdlqQB9s+NrhAJ+9Z5tUTgul+K9EScUx/U4muayxEUjbZf7tS5yS6zXmUsT7bmB1pMYGxLH8CukW7UoT9wQdxkOOEi+uJ83zVP2l1B0I/4wi4VueXFx5TcyUMF5BkVd8WJTvjROKOKqEyuzTbgFeo04qNVibrttYrpVU3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmkohRjE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSfm032319
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 13:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BoF4YU4Z1GVybjwUeS7Z/uv8
	axVlwSxe5xZqCYbacGo=; b=AmkohRjE5AerN3V7+IS0IkKqt3vukuuR39Wh1yLP
	9p8ZlK0JVwMz6b8Kes5HVfP5itfI++KuiVekBLInWumZ1kETe3w/NVYfW9v/LXht
	ObwR9dYfrr+OjrgPQItL1kVHnbnG+tWDsViFUycjPII4ARtpYbmhMq3f9gWzSO4R
	MIWQAIj9UgU+NeE5DgYrUFo3rtalUU4lWBxVHFlmrfcrFF12DrXzpyLtcL79z1yR
	VpSi99e4E/wMKBjjeM4nADw7dudoIitZIu2C9L1xUyjxQQZ1sewlRrY62TlzpA0m
	/8N+FL1Ak4j/5TPX/P4r+d2dEvlSJL6ykkISAorhIfUKdA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m098u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 13:50:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-726a649957dso121609426d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 06:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757425827; x=1758030627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoF4YU4Z1GVybjwUeS7Z/uv8axVlwSxe5xZqCYbacGo=;
        b=r6cKQBpP7U9xE7P5FwRka6IDw3fNXDPZp5GY9gQ7iZmR31ZqMbCWSXrn4EnhRhbJAB
         yEsk34hPoFCQzRGVSeUfFq6NjEFw1HchpOk4UAEhtIdKEV/T9S+IoBY8bBab6iAg0vN3
         sKYpvBr8D4U8ku/X8B1s5vufIYTBLPa+cok5+QomsOrquNO6GqY76Dvmwj7xpD+C12JU
         BQxp635mQeyuTwq1hK93bPtAtD2eZDeUHA1m0gddwaRa3kNNIlZFD+0u4jAdU0IlkEeS
         VUwN9HUwDgLaJnDcvyMRNxF88qp/J0+IytsEKUPZsTd6z9L59xJ8WtZUinIW7PEtZNU+
         lIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDdXe2xkADddJDnh4KgiCOJtE5qMgDYPPeBXTtU0TfpaRwEHl35YOXCr/4UiSVsJf+8fQ81Kt81uv7+xAa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm1wUhl8uxozSqDSYxNYQD4H/+AcfWNxx1vewGL86x7SLkjqME
	ngLkMcI+/PnGb/G63iaLmj1H0I3J3/rAIvRC0Npdbas/AukKYduLM9rW/62TilY0H0PhcwCVYmY
	1BybY6UvMSMfAAf+qx2uSz7mkgcGD4A7XBNiVBiUBNOXG1QkziSuKJDDDWeIwhqX18n4ZOFwOFT
	eJ
X-Gm-Gg: ASbGncs3Mj7zpb67n99p/fLaNQVeVQJ6Sk1KnRzuG9rI9G5rfdaZOcsQpRRQQ89T2NW
	d1KmtwkuzmRkfiSjxwXlxG4u7zqmq7c7CB1Be/VTcYWJzq3SIq68A0j18FvBBgeELaS4YzrVZtB
	xc6bXldnz+86+mS+SmOkwYBNZgXzcSFGJtHLnq7289/hEbPDNnOVgLWM7qQlAnchcqqALNs6PAq
	Ish6LhH95qmMKvTfdIIohloYQGmuL2NQNbv0laCILv7b9OdqpH7aryFE4mVoUEd15D7wh4DQPiz
	VIxohmNEo0XfSas2LjVsRrMY8X8nRmxee3fzQwcLt6iZ4FfT32Zu7S2Wy6WIYXY1n5CdszkWqIb
	bhZXFMhQH35twxKqMXMXlIyTijBts3NxlpUzmeOPt/d8E8kJiekgQ
X-Received: by 2002:a05:6214:2349:b0:70d:fa79:badd with SMTP id 6a1803df08f44-73921a43c65mr116264496d6.1.1757425826768;
        Tue, 09 Sep 2025 06:50:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/4AThO6Ll+SaMNV72t1DSQpSQ2NXEUj0ahvpr2YyKNkF66qrI5AK9cWuDnKGSXBYMcoEMbQ==
X-Received: by 2002:a05:6214:2349:b0:70d:fa79:badd with SMTP id 6a1803df08f44-73921a43c65mr116264156d6.1.1757425826207;
        Tue, 09 Sep 2025 06:50:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c503d7sm39294991fa.11.2025.09.09.06.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:50:25 -0700 (PDT)
Date: Tue, 9 Sep 2025 16:50:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingweiz@qti.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: add bindings for QCS615
 talos evk board
Message-ID: <33ldjudketkyledzp473bwal4jmrigozjjwqtqlrmrkjmh5sze@ak4cusfossus>
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909125255.1124824-1-tessolveupstream@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX1jSJv8xQhKXx
 OZyNlCBk48XwaAfFXcWCh+tkh25WpNsk5X+ArGe9MmWwRc08yU5oiQnJR9sBtLA4UWv5sJ91jdn
 obvhBoNybJlWCGDm8ezQlJiEHXb6lCYIsD/xKdHYZ5+OWwIQpSgobvKapdEMdeW9AkIsnD+VHI4
 qblAEnDNulmEmS4Oml8/HHMPl1LqKncrU1LLto31MZhio7uaScgYTZ28BIMVpBs9hQzS+nMtoNw
 eiJ+FHBX3vnUf/VxVPgTRI+u5T5KmemglhOytrjehzLDw+luuOy4Id/UIiIj82Rz1HbYVNrtBlA
 YnklViOoORGK2jobs7wEKhDTdGhAy0pQdBCHpIJhb6rm/xjim2fYnCYFgBQ4zh0HoOHYMAOEo4v
 yQl4/X2C
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c030a4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=CwtUJbH0faq6zwYj85AA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: xMhCZPLFG9EQrf7NzfbGrGV99-1PIzdr
X-Proofpoint-ORIG-GUID: xMhCZPLFG9EQrf7NzfbGrGV99-1PIzdr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Tue, Sep 09, 2025 at 06:22:54PM +0530, Sudarshan Shetty wrote:
> This adds binding support for the QCS615-based talos evk SMARC platform.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 03a7d3c92ecd..a5dbe6af68ac 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -952,6 +952,12 @@ properties:
>            - const: qcom,qcs615
>            - const: qcom,sm6150
>  
> +      - items:
> +          - enum:
> +              - qcom,qcs615-iq-615-evk

Should it follow the recent example and be named "qcom,talos-evk" ?

> +          - const: qcom,qcs615
> +          - const: qcom,sm6150
> +
>        - items:
>            - enum:
>                - qcom,sa8155p-adp
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

