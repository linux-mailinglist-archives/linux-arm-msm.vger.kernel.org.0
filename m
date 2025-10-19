Return-Path: <linux-arm-msm+bounces-77928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD650BEE92B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 18:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 046943AA95D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3C32EBBB9;
	Sun, 19 Oct 2025 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cl3aOc6S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F7B2EC09B
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760889646; cv=none; b=WWiaz/9EWsmrjqptqlVauYvq4/er5OUZrrYdbyX2HnnLtOtsDaQF1XrYlXHHzy91rC6IXPNHxadbQQPBDkaLA3ecVCWjZpC5vvxlhdZRn49cl4Q3AUAZ8zkDRioRO0kOmvNODuQUAyxsOF8dF7IGcNwxkYHbGQK7DoeSAbe+KFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760889646; c=relaxed/simple;
	bh=Kf85A626unFOvqMadxHZ9Cr1Bq/4e78kA3D9mxQntak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buaFWowNPxNftiXQabF9tL8AhBma+X8Q9svwL8W1G1Ml0FjXWlleZaCgdL1gaQrsAGinBLqz4RFK+WGGx0poxJhXUl+07KC+ldnejzkFrrCavL6a7UqcpanwTfuEdZQ+5ZeSBaJI7JCW9bHcp5BrXo0aAPcn5/FQA8mx7EETGyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cl3aOc6S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JCV5mF030470
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I0aOhuHfsf8NnOCKsGXsoFF5
	VUAwjGMlD/AzJt3MbXQ=; b=cl3aOc6Sy5pydot+kRNSrbkrFxMsjMCn4XrvpzKh
	bpf3Ug8jW7hWdR7wKP+GUa051yguULly1KjOX9wHKqyCwoz9CG1hr/L42bSmyCTK
	ruWSzOAAgiB+K4z9GHh/aPHnnHLggkFh+LTf9Fb4x9ZN+GoNMKgEOp+GXiRvlv8L
	f68H8OCb6ywMtZrm1rE2fNGaX9HouCgG7OplN0st47ppI4spbBykC/v96Flia6RX
	9zf0fGflY7wsSNr7FnJZeoE/WS5Yv7fhQ2AxJTW3mUdG9faUdxhGlMdyO/XF986q
	eX/uGS50zfMH7kY2EeldZ685pW7BEWSKkqw93gmrJ63NLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pavh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:00:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-86b8db0e70dso159112916d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 09:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760889643; x=1761494443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0aOhuHfsf8NnOCKsGXsoFF5VUAwjGMlD/AzJt3MbXQ=;
        b=Dme3UqpIOklQlG8tq78Fohup9ZY8UxlAiAqoomhg2o7d67H1nJAGyArCDt4XDXhsRG
         KYUaxOgK8vhtgkjPxTBGz7ovUOyTEfxFsNQXhWsM9b+Rihdz1lu8tOLtqqePspaYNc8a
         xf51FLJUPGZb+A/oOinEgBSAlgQ8G8BIRzQgU1358Rou/xnKC0IW8oPheQIwON7SIGHw
         tXe8lRdrbwNDNr7A/XHhektfzpE6lOdR9Y5PS2ktCDH+3lxdwxjJgQ3fUgtgMr5J1dmN
         pmM3/VQ7qBjUK5ubBaiV2JReJlPBKbSplfYfvyd5+711oQF0/vPsqBU4r3D1xuWDlvhd
         ycOA==
X-Forwarded-Encrypted: i=1; AJvYcCVBvlbpADHbgF7k5npPDaiQ6N5c6AsVm6zsD+7o+E44GuV4xccMLwbXs0o31E9b0jRuYgi95gXuGPH+yMK3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0rL29KZlEr1ByAOQFwaeqxQYQ1nKl4jv9LS76yEz0pa5Ts1W
	AGO+u09RnP9o7Z9M5S/NI57vZHU3KtAjf+SSkMcmPkqhO744zkxc7WbPmktdmC8oWQnHxvMmngc
	gNXD52+RopIFIwPNQ09wbYmA7tSsr6Vj8xtczmxiTzVEfg4YCb6372in+50PjexMN8wxV
X-Gm-Gg: ASbGnctr1Uv2y5PAFsNTweoN3m4hmLezCAv6Idv5l5EvjpKFlCoSH054LFS9rYolS8d
	rConXa5LCPvUYG7ysVWj5+40797yIla3ftDA8JdAIVnVpUzJFqwlu94r2Qm6RAwicsaozd8LqJD
	zarbpaOu4W54fDX6ptxnTur6BzzmBa2JPV3LBt6rDoYs3nnbP4UGzKrbi7xtgTPBIT5oU9sqAIj
	/WXHfnhvO6N9bTUBKYqutqHtcChMwyDo3PwJje/xD6Mokhj9znX6bU/uAJfzJzJPkLG/E3TaXVs
	pxczuvcnCH0aFsdxIbSlcx1pumRKuSlAFGV2EcjQc60M147TO/PQIxcZEwMTvD9xq1M0+zUpkL7
	y28/Au8eEOQ6Dvo/fm+8veYqaPOkc/XLhPzdon0c01AurOcRkXZBK1yh9YY+/AFCUyIqRhMf6Q0
	wopPGxm1udydo=
X-Received: by 2002:a05:622a:587:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4e89c56ff04mr156963511cf.36.1760889642818;
        Sun, 19 Oct 2025 09:00:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxIuS6L7f7xl2z7A/qtPnCnl8+CWdxgG0dYfEbSDh9YuNhHQTedtbsmxKzGddTEFlE02CDlQ==
X-Received: by 2002:a05:622a:587:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4e89c56ff04mr156962901cf.36.1760889642395;
        Sun, 19 Oct 2025 09:00:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9508d89sm15105791fa.37.2025.10.19.09.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 09:00:41 -0700 (PDT)
Date: Sun, 19 Oct 2025 19:00:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Restrict
 resets per each device
Message-ID: <i36io3dee54fngsiwavyzzxsqgfoxezwm26gi22jf5nzcmeyxc@kkd7s2oh7jpl>
References: <20251017045919.34599-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017045919.34599-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX4784CSzyaG/B
 RNGy0XorYUS+yaNbmSAgm//d/HA/F8+9FUGL0IHRqjCNobXpWoVXjwTWdUXnderpmnDuBrbGrBz
 KFAuXBeSbbfXpOPCFQytXBMYGFYd03agRAdcpsEF0wJu2E4i+IamrYpg9f9ylBIX86hc75yPem+
 LXt8rJd2D7aNdYYNJVEFQpW7N430uKKpm9E+tLgDg0i6VCiJiKEO0DDpFOqlGvDdPYCw7b/FVhe
 03KSf0puaV3fLMt5ewKm++4Z/sGhvonGDPdNuKj9yziaAyqojFZ3hdsBTDwTBJeOlFs+ToglhsW
 EAajcNy/S/Yt/d0LTbEF8O5z+B43Ju9Ula6EAXG1XJJ9tekQjLZoydZD6za+qP9AtCWEuKwKOxX
 LS335S/ydo+m2q9NWhhkck5K1XtVug==
X-Proofpoint-GUID: uAJ0CiqPz4gfWdIexwi-3NQDrKN32hFg
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f50b2b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=hUDxmADzl2bKAqMNfzUA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uAJ0CiqPz4gfWdIexwi-3NQDrKN32hFg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On Fri, Oct 17, 2025 at 06:59:20AM +0200, Krzysztof Kozlowski wrote:
> Bindings should be complete, thus complete the constraints for the
> resets by adding missing compatibles for devices with two resets and
> "else:" clause narrowing them for all other devices.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

