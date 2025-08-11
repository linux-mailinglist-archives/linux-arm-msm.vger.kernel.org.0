Return-Path: <linux-arm-msm+bounces-68372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0AB20BC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F4463A921C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF12235047;
	Mon, 11 Aug 2025 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4qFdL7h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B4E235076
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922165; cv=none; b=tD1Z8g3IA12drZ1tXzdkC1iXVpJ1hRlhYoju4FQLN5us2T9WfMweMKPT0jTULoc9C+bjrvBoCiTbUShyeV/6GkKqf7s7pgLSTSjU3cmVX+Bi2US6UZh0D736blNl5D17wjg0Ixz4bVDtaDuR7ash8/IlfBzacYoSwjg10w37bLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922165; c=relaxed/simple;
	bh=sGxVgbpfhkMiC2JIzxyPIDukcvGKIF5ZEd6qaix17IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsKPAjOEr+yb4UwS9iw+J3ABrTp4eB6eYmnyYyx053P78mBsMUV5Lquj9g7pEiltzF/77pUvN/O1IOtsWz8liKf5w1L9fmsZD1FYufbALSmPDVOnJs9Uz9eGQtIbmF3QX2fRnKObqfElXnw9606UKAVZG/a9ynwIQhQ9SwzHWoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4qFdL7h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dANY028829
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 14:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=atvUDHFH97dMJ5RNFFG95hKk
	/JrHvvz/NgsyopsiKk8=; b=d4qFdL7hFWSQqJiJGacCAfvwApxv3jP+S7g5HIx+
	xQZpa8CGuoSfNX0Ddv6iHZBVmd671cQnR0HxEmfbbFfOOe6QQwNv4wMdXjWyGKeO
	4FKZNZumtPL9JBwFDTS8VO9DPnAZVUHnE9u0rAHkGR89T22x+zLoexcUwsu/rmLe
	IVrGrIQ2jcIwy4lIb/rVFiaZ/pqxzTSfwHrkDuDBurZJWdrOZjVvYLVYEyIlnUjP
	vvyQNPFj1Af+30GpLQi3lSEoH19LLIvUR+9nqlwEfRIRhVNGr1lWxiRpAKFHOKa+
	8tR3+/H/txKJAPgXzmnFt284sQTgOo42E3n9v2+Mfub82g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9smtxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 14:22:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-4fe1823af5eso1268851137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 07:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754922162; x=1755526962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atvUDHFH97dMJ5RNFFG95hKk/JrHvvz/NgsyopsiKk8=;
        b=XA9ocmVXOKxyEN7P21u5fG1ENaICWHZWIO/vLYzVsTAmOJH/LDlaoLbuU/1OSe6vs3
         J2yZ7VquoW3yv8HHkcktNBs/uRXZm5JkZMqFiiyPBJCjPic3mhLfcNsHiyYKy86bOAKR
         z2IlnAuFYwfDc5zQFg54IKoGxbwYxLEc1yy58xl+k2b1PKdJwk31OxfXbsM/Tz2jvc8M
         aTNWBuTbA5qpqZVN7hlEQGFuEokk/HLLPfYfuFmji+fQZ1+wU//i5WLvu23khypED80J
         wG99YJ5U3+hLDmkj/ZpXa03MuuVO8HY+TEI42rAKqhYUwTiQe7A9T15GhKtbc0s4mwwa
         AONQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8WTda2VXiD+N1qwA3YM/B5tP3unloGk/F+vUTel6UtHn/vqSw/ZtC+Z72+LqU/Wo/u3a0jLYsqBHVu2Zh@vger.kernel.org
X-Gm-Message-State: AOJu0YzTkESKbfOheoQN90Bn2uw1HuSIQool0zXYkTY2ipuUazZ+VVTC
	dF75tlUEiCB79kyMYHxyhbMgtkuWSoZKF7NU5kcDxJrwPMfBKRujd2BZXKfRaYIVepBB2tHfoeP
	XIKeGoV02fbp5dWJpR77hcZM4ztjIZ3BatzrRuGJLtYxHq+8X+uxBq42r0mGVZcw2MhlL
X-Gm-Gg: ASbGncvacMIVQf4ffgv5YH3Cxy8zP0hl2hjJH1kts6ep9MWV2NhR11ERDzRjqq6BCgF
	MD0Q/8qN0cEO3JQBZGImE3qHGN66mfCi/C2SIi8fOIrMe4g959AY39zSGIDTDZxvzorkRvwQAgm
	OAnhnaVokBZm5eJcMoJMVbEBX7WljYscfxmF/Nc43o6j6qrVCfeVw5oprYKMu43mC14NT/evYg5
	2Qu0vG+C8SmXsM/f11UitP6mGW07a1joaTZgqoxGGXesaDCl6ptXp2JCh7XzdTrWOFn2qjKLTOq
	cz3z2AIYo8MIwHRLc+fdFs5PN/3Rjk3+Cwn1CAhB2N8P0pMjRUIlvXvvxp9ctZsIXPpwAoS/GAJ
	6LLoF6EL3v2qsSJ21RCjuAO1vck6T0qELUi8O/vSTVukna81WhDX8
X-Received: by 2002:a05:6102:cd3:b0:4e2:ecd8:a27 with SMTP id ada2fe7eead31-5060cd85eb9mr4315518137.4.1754922161812;
        Mon, 11 Aug 2025 07:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkf0wesS+SmsO1zroWaYcVzGdW2MbxxsG794FhvDnHJ+rgmgrOMISGY1WD1WC3+A+gym4Dsw==
X-Received: by 2002:a05:6102:cd3:b0:4e2:ecd8:a27 with SMTP id ada2fe7eead31-5060cd85eb9mr4315484137.4.1754922161414;
        Mon, 11 Aug 2025 07:22:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ac575sm4336851e87.69.2025.08.11.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:22:40 -0700 (PDT)
Date: Mon, 11 Aug 2025 17:22:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] arm64: dts: qcom: sm8750-mtp: Add WiFi and
 Bluetooth
Message-ID: <l6u4y3suv3dpylexbiiznhcuyanlc4ouizhzj2cchblaf6o4wg@fe4laxrioaj5>
References: <20250811131055.154233-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811131055.154233-2-krzysztof.kozlowski@linaro.org>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6899fcb3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=TzfybVupH9i6CaRfqM8A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CvyfM5aGBoJVaTO2lBFHvhiOb9IyGcO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXzxHodypRKe+i
 nL6/h3hGH+FL6zPItDFbo3FytDnubjq2uI6b8XnlLV/xK98+1s668uSgScHhFw0oLU2wVBqJxzo
 7SrTxa1AKhcz6Q3FKJwAg/Y66I3xNMGAOGYp/vrEuT2XtSahFph1E5EAf6LRm0jaUfOCswt4fn/
 6pQRAaaguP68SI16sq1zOlq3u6P+t/TOyTtcFLAFkddpFunuRVbK0wBxhUYPcDETAAgTpqHJOKC
 U3ef9FSQGuDxuLuiyi7xSwWMABRr2/7bCJVbaQieL7pAD+EIoQcZphAhg6N+5HtBJblWI6hfXMt
 Z4CrGNYQeCIQ5YeYDbYU3MdD+wA9lotDhtN79UNnOjqtfjT7J/t/HrfeiuStcKgnohRWjKwSs/T
 9uh7Fktp
X-Proofpoint-GUID: CvyfM5aGBoJVaTO2lBFHvhiOb9IyGcO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Mon, Aug 11, 2025 at 03:10:56PM +0200, Krzysztof Kozlowski wrote:
> MTP8750 rev 2.0 (power grid v8) boards come as two different variants
> with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
> supported by the kernel, but WCN786x is not.  Both of the board variants
> are considered newest revisions and the difference is only in MCN
> numbers and internal codenames.

Are they soldered on board, installed via add-on cards or installed via
M.2 slot?

Are they going to be somewhat compatible (e.g. on the BT side?)

> 
> Add WCN7850 WiFi and Bluetooth to the MTP8750, stating that this DTS
> represents the WCN7850 variant.  The S4D and S5F regulators should
> operate at 0.85 V, thus adjust lower constraint and regulator name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

-- 
With best wishes
Dmitry

