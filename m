Return-Path: <linux-arm-msm+bounces-86493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1B5CDB860
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4BB6301C407
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5B52BD5A1;
	Wed, 24 Dec 2025 06:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ei40aiV4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2df+q5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC9B2147E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766558224; cv=none; b=fzBVU9CWWGQaLqUEFrBIJv7o88HE697LRkYe8XQpxQQLjwXY6SbV3wT5asxmRQU2pyHFhnDh2lXe5cLS1UfqyldFiJZzhXdsrK1s64J8+D3yTEOcDh71X9eZYHSeSWISrknlOvOn0EO/wP74udIpAxE+p0F5blwDrUkTr6JRI3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766558224; c=relaxed/simple;
	bh=6B8038D0QHS1kWNK98dBS1dn9s0Ga0azgTECtt1OUUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOk2bv94+J9cw7cLxDk+2F/1bUjt8YvgC2kQKzFgXtkicW1HucSSZp5qK5zFaara3vKcY1ohqe9sBf3/4LNf5aEYUU9nNeIgmsQzcAkb+UtACTwBHEvyzAEjxrfzM9AuGh74cpTA5U6y2RSNiuQsQLvPSZ1VqyDZRPasCmup29M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ei40aiV4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2df+q5K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wUmx3796871
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KeX5BfcX6vNByzVdG2gumkgs
	oVp1IkdZbk816xn3kj0=; b=Ei40aiV4UwtrEMsNMl4mHo2xpKBlXKccPSZDFMa+
	I1LzYWIq1GkHLezukjJyHX3XDUMhDT13hthskw2QHDQ25Iz+dCSKf4z6UtDkRv00
	vkW/q0cAI/c9tCIuiHWk1JRC++G3Gw5mXUFNKo1xqHmmoJ0+zaJEy6hOW+/0WhIx
	OFbXEQpqLhv/HPtPxPYmFW3Ueov0bl6ddTAPMMkcyuh5FsiQG+lFaY00zSLG56X+
	L1Pw2LUx/cfN8NuwI2HVozGDDhVcU2ZKktoQt8rlgQL6DWd5YHUnFFZjn+A3Ekkc
	vb9t06A/I7NKqPg4Mzl25qf57ga2KgFKhN8pif8ggsS3JQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r68bab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:37:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edad69b4e8so119999251cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766558221; x=1767163021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KeX5BfcX6vNByzVdG2gumkgsoVp1IkdZbk816xn3kj0=;
        b=G2df+q5KfkhEHaGLuVH60Xw3EcT8FyheTEUV/PTCi2ZNj2nXzq94JsRRmHIJTqKF10
         r0vkNw6H2cghOBqeopJYoQtHvYqmcLoH462FAvM7jZWX5LJIa/+3i41wQxB/B6Ai0gIm
         VOqDOcQoiETcpmSGv6PGeD6sxZ9eqmAC/NsqQHw9f+sh1ujWgfnwIccZyhwmkP6otHbh
         oyZPad3hQ38USeDi9yELmtQX4abh/lbovUTqZ0FZLx9bNw/gQ4/vicFtsFWHOnh/9zGO
         oYFOe+lN3WXyxzLmj2YV+KR0qBxWm3ug3gSIRSCKpiP5vXbVLul4DtSYS7QRfzJ8QUoP
         WgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766558221; x=1767163021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeX5BfcX6vNByzVdG2gumkgsoVp1IkdZbk816xn3kj0=;
        b=uMi41SmC29mLL33zhhh6dTEZ+h3DvC1pIJ6Oh7wIB+NChh+QpiEenYUTiqH8CMH+VF
         xIh0j1lcT6Ml++zufSwFevmXMy6+i1Su47GahJS6Zsfbfc+8d81Gu5sTYbDpyIqgukRn
         BEZAZ8GS3z9oBBvI6je3/GNb3qJLAIvt9LlGZyMOzhlopkUQoFrlRf8pWzC7/WCKVEKx
         8kOQZog3KHZ/Np/lXLfP2OM/wBz2+o+QWunpCkDrB3rTPjN4xO6Ki+0MHf/d3wp4AJfV
         o6K3l8pJUkDWMEUD5c8PfUbpJa8T9XeZ5uW/HRe34GjmzibvopMlJUHU7LQN3Sn3TOo0
         9boA==
X-Forwarded-Encrypted: i=1; AJvYcCWlpPOg3wg//uU3WcFpc7FMMHaO9zh+r5Ps2Mk7tUatf6nH+omed67inwBeacRziuWT6+HmF5oSB5vEelQu@vger.kernel.org
X-Gm-Message-State: AOJu0YyGaA6YiziF++CYbpW9V3ap5kbHK2ByRIAAuilWhOOxVeTHcbTh
	/4IRBDUH0Mqzgr/KMDnFQyEgdCAAcVdQrv2wl80ALVKXH8zWejyKOZ2O+dr1fXeDV5SjcFSfTSO
	DM5tTBsiIGTFfwj1DdJUYogTQWXl5w9kR41ALg3hWZ7KLexP3RCLD6uBGN+7ud1+gXKDi
X-Gm-Gg: AY/fxX60X5ruGYEXTyghpnHmTPCScKfBE5J9kjF/cuNQD2+HGbyRNQ43GflWI7oUgmi
	iz1XFry8agvR0iAfI2AIrxzlJ6EWxuM3+1hsihV6Cvooa4DphnBJOdrAQBVeh+drWaqPugXaXIf
	h7mACFsbhl8spEX7Ew36zX7fUGMbhQh0zGcZu+eUhy7y8rXMJzhRP+4H0hFHaSPOD89XEVXAg8B
	BnME4OPuxpqit6eX/19wUHMrdtYBNhdpFlhw0UE8R3TLQdqzpVKvzfvREJT9F12Y+YSRIEFqzJ1
	HIOba3HreF9iLqizezX0pHZ0ChKRBHqAgMHja6y6B0k2DqDR++kOKYC2+JwVy/+K1pcGikrwJKZ
	Aa41KluQ69t8ATjewmVvw8/tDcGuXkKfOETF+I65keWKOGUBNr0cmfDPpr+CToDEhmhc2N4V6Cy
	h6483J8eQJ/FpooA1eNIPoSyw=
X-Received: by 2002:a05:622a:58c:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-4f35f3b7549mr296548021cf.14.1766558221386;
        Tue, 23 Dec 2025 22:37:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfpClwcc9VlLbybjSbaNc7rAMagT1DfPo4Txy+E3PjiFL8vV/x6N/mNkuPkqXE1VP6sSd9Dw==
X-Received: by 2002:a05:622a:58c:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-4f35f3b7549mr296547861cf.14.1766558221023;
        Tue, 23 Dec 2025 22:37:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d85sm4591957e87.48.2025.12.23.22.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:37:00 -0800 (PST)
Date: Wed, 24 Dec 2025 08:36:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
Message-ID: <bfuds7xrlgril2r2y3hysmvrboobietm5garm5q6t4gy36jvuq@qyosxqib3nv3>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-2-quic_amakhija@quicinc.com>
 <20251125-mauve-tamarin-of-education-c94bfb@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-mauve-tamarin-of-education-c94bfb@kuoka>
X-Proofpoint-GUID: m73UrWPEtW2xWcQ-O4btIhk_hnzDG8Gy
X-Proofpoint-ORIG-GUID: m73UrWPEtW2xWcQ-O4btIhk_hnzDG8Gy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NSBTYWx0ZWRfX2BqTqqeZOnHJ
 n3wYm4azvZxdJBsbV+SrgyYxY25nMOUQ35sF5TAI5NEHPXdhUbdI+eq5HQUghEeJLdQFx9DvTwB
 n3UXjd6UBaQaRQtHCaBBTnosjXpNA1IM6jCsQzLQosT+khQoxqmvGB0zx8NaszJMhEj1r0T7eSQ
 KfL3dBroxHbxItVhdWtqH6xeKoJPQvKvR6J83EvVDKU+IC5bQXke5Tddsi24rWou2jJY0OEARCx
 zTbjizFKeLtd+Q5dLD48sdTXOOedfyVP4JQz+M0gU7B/46iXSp9VxS5uSLZ7EJpbV6mj9Engg+1
 OInaFqZSLp2y586pm/EwxTre0b0fPZziRPYYrSwLT9D55NEOLeZ/wbvGMeURQTDkU7vy77k4LZQ
 bEk07iJHGgbrhhhFV5stUq8QJS1hhcL/LJyy36YwpIz9NS1JHO4HD1t+CcJcNrK5030m08e2wyw
 LkOylkHj9pt7FjeaMgw==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694b8a0e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=n9dR2hj5eY1oDD93YXEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240055

On Tue, Nov 25, 2025 at 10:31:42AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 07:02:58AM +0530, Ayushi Makhija wrote:
> > Document the DSI PHY on the QCS8300 Platform.
> 
> Explain the hardware, so your diff would be justified. Instead of
> stating obvious or copying the subject, say something useful. Why this
> is compatible with different platforms?

Ayushi, any updates?

-- 
With best wishes
Dmitry

