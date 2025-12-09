Return-Path: <linux-arm-msm+bounces-84821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF4BCB1678
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECA753009870
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2B92FC006;
	Tue,  9 Dec 2025 23:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUENsZ+U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGhCxfEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1705C2FE06E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321928; cv=none; b=hfSw9zqgjNp85OenKqYl28z7CROfOy/XVZlI/SnhYieqQ+6/L0hdZQgE108kHHfRFW9tmNYtl+mp3gjNsgw+zpqLijpaOirvIcp/M3ueOOzN4KeUK/l6e9A2Bn037Q/MRNRvGPv3yYawL/Gudj2gtkHgNerRWiZN5N/wlAvIXKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321928; c=relaxed/simple;
	bh=8ChSwUHdw1a4imlf5mlmeQxUhLaTIcEsabis5huZ3Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmCFp5vHa5fv+U7UcwrWnwayg49QsAwLyJ//zFVftzOpqknBsVs4p6yYYfSIr5Gy/6pKBpEas/rv8LRXy+zMUHoyu9Lxuw2ikKw8t1kjL84YzjnKBlsx3Nt1kmpPJGqPmqcd84odSWe4dEDogtm8w5Qv6jTKILLYQosbAQrUIbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUENsZ+U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGhCxfEU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9NAj2X884698
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yMHuwAiVf8kefegJzUtXsfVv
	UTlRrVd+3Q+FhBxOBH8=; b=dUENsZ+UJ48u0p/1msQT9rVhIGKb02OnAijmb37H
	/ZpB1cnL5zggBKtBa7/meWrX33miPP+WWGJk60bw0UFDJYPy29YSGkLmX/eJqkun
	mS+PK1YRkPvMzt9egwq1QkEd3ALLagiO9ETrScucsswd/IHxk3RUXJeRRVZaYBJy
	82EY15Ts9OqngLL4tNPrv1lsxfuBKom67rJmvYV5oBKivSaLME11mZigwwONCSK5
	uYDed95ji7W51UClrZv6HMKE3JU4xfXK9Hk/kVNo0YSggX4m6XeAuWOfjtuof+QW
	PNNDrBurWLgIHc4d3NOZX9CLP+hisuz9FRN3n/cM4lDCyw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axrhm8uyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:11:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee41b07099so76004531cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321919; x=1765926719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yMHuwAiVf8kefegJzUtXsfVvUTlRrVd+3Q+FhBxOBH8=;
        b=MGhCxfEUMwDpBeD6VQ34DxqN+ZBB7IG+/EXpPl5nwJkP1OdhgGLC+2GxRmUNw2aG9e
         mq4WWbl7G70u3g6DdbGGaKBpDqqUgD886cvZEwI8/axsgSMA9O/I9f4NpkMsqHbELCgv
         ct8y5MEIy4QlpLCcBzkiF6NR0e3yyJ8JUAx9szTFxcRc1ZN58H24+THupO3lxSO5bWBA
         6v5CF3M9Wmt0TcEPIRIWa9eVImRnjP5B6wnnEOSWNkBfFDrJ4md411X64Yby9LWq3lfY
         OPtVJsVCa24zEtSu4p/zSkSVoK/IOnOvhq9Zbt10cLu6B42pbEZPquokv5BxEaF41cZS
         HEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321919; x=1765926719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMHuwAiVf8kefegJzUtXsfVvUTlRrVd+3Q+FhBxOBH8=;
        b=uyjDwQDERdC+1qoDX+PY6Vqp1k6h8kQCcca9A395nit9eG9xlf3cu2sJXgOZKckev5
         bS3/skFwAH4WJxzWFggoyxK1VszFv/PzAFAMSi8ZC7gr81vFtBsxFoEAvVXaZB//Ptac
         nCyEx6vGsJnGa8OT8UM2MKETbDMa2QIUTcQNg7BHg+XbSnMdomF09c3PdjBpfrX45OPg
         QCB6MHvXmUC7kJWLyxIFz3StHHEcv82MgHm/HTo+Wjflvn5qaB/UFUQX/GMc2tgUc9rw
         BqRrH/B4XyQhjJO5VwKh7Bc+Qbw403vYSdMUuuG6U1FBYuCok/1QjaHQnPfH86Ptu/lY
         qpGg==
X-Forwarded-Encrypted: i=1; AJvYcCWPbqjZhCku5Mlv87l7IjpA3t+MPgAJ5KahvOJW0vb6aoZ92lAP2+purieNpEezt12/tRgcKaC2Vv0T2hz6@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ0foaP9pDDUeKAq1OJkZStcYHjv8YMjvCT/dZ0ebrcixitcSA
	LqhQfHdwsaOt2sx3A6EdPCEBccsKD1FUWJzkLBRcyBImyaxq3SCRaF37O3YipKuFCzV+CAwozON
	Bdlg4ugaIu5NV6PnHu/ibNcyxqNzqE15cZ7dl/CvdRbfDB+oY2WJs60m3E4aty8cd/l26
X-Gm-Gg: ASbGncvM9AXydUDg7S9zMJLwRzxBiQ2fTQia7ab8gFDvGElL02w9Tu/t7I0j8ik/9F8
	2KW3D1F55z13AbOEAdx10cJptcn44H4VG6lmXFqBflad75sm9Fpel3CaA/QTUfRTfuXogDSBY4j
	eaxjwRK63IjqiKGEfvj9mR4HPDoMyiGfA918KIymP+CJLdgZjvkV79GmLQDyVOSEVqQg6GarBBu
	j0XAJE6I0lUQYBsafN/os6qIFgFust5whatdsvq4Yxd4gvjFMnbc0SKUR43jkj3NT2xDDiQuN02
	0Wdnph6a798FJEoEOOoyQsHA9dN/CB6wDfA2sX+69pfbTYvmlMiTQP6QmFP29Xf4ahKfwlSurRY
	sikb484Sw9kiaBuy/cutmaNBxUCa90EsgP44pFYqA0eNCoxgz8FLYOm/XBmxeGJ/ZlQFK4mLRNN
	mwOiWtuAk699gMOxlfy7kpujw=
X-Received: by 2002:ac8:7d48:0:b0:4e8:a850:e7db with SMTP id d75a77b69052e-4f1b1acb520mr6471791cf.71.1765321918996;
        Tue, 09 Dec 2025 15:11:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu6YCKe2+d8qDTizG/xo9axO+MFsZsv4tpX7vZUCsXjf711fNSYPHhgGJP5Gi0hx5bGJ9bNw==
X-Received: by 2002:ac8:7d48:0:b0:4e8:a850:e7db with SMTP id d75a77b69052e-4f1b1acb520mr6471451cf.71.1765321918535;
        Tue, 09 Dec 2025 15:11:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b24725sm5549491e87.22.2025.12.09.15.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:11:56 -0800 (PST)
Date: Wed, 10 Dec 2025 01:11:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: qcom: sdm845-oneplus-enchilada: Sort nodes
 alphabetically
Message-ID: <zdewy6qqwm2v4sy2r7mh46y25pifbnvqqtm7ej3aqjxj4cxnia@njdfyta2qna2>
References: <20251206-sdm845-oneplus-fb-v1-0-19b666b27d6e@ixit.cz>
 <20251206-sdm845-oneplus-fb-v1-1-19b666b27d6e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206-sdm845-oneplus-fb-v1-1-19b666b27d6e@ixit.cz>
X-Authority-Analysis: v=2.4 cv=d7X4CBjE c=1 sm=1 tr=0 ts=6938acc0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1YaDnOEcMAd5D--0PjgA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MiBTYWx0ZWRfX7xkf1c2SbUQq
 yNGu+xZ95j+IjQ2TAKIZ2RqH+jcy4A6ecjFpbh02B3JOKanbfTM9nc+8RGMgks6kz6x4ybNPWRi
 i6/my1yezQtiYP4O0DWYJtlhB/GAKHdjLA14cFTP6jTRxjuXJUCwbShr83EUTUbeJ03hg8jzGw6
 oJO8BBeGPWhc/UugiYSe8Vbu5TsnN6kOGwrMVGWjvPNq+kFVRfgLNlglsQuINaYOu4FcEB+fgLd
 7pw8FzLepRATpo8oHPT+l+XPAaKzI4Ezd75xBtrjKXisdZoOZ6k/PGNmkMvpHA0tQAMiA28e9Wo
 kDPRpLWrZDPaSvRG3IRsCtc0tq7gZxacFWIUVyZ0MDhCoycX7iE8FzJAxK9EHW9h0Sg5c34k4E1
 kJvQrQPJIU6iw9qUv1LX3JouihPptQ==
X-Proofpoint-GUID: n6MR-YhPFniJBydw2fEZ691Hcnth6iS6
X-Proofpoint-ORIG-GUID: n6MR-YhPFniJBydw2fEZ691Hcnth6iS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090182

On Sat, Dec 06, 2025 at 06:45:42PM +0100, David Heidelberg wrote:
> Sort the nodes by alphabet, no functional changes.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

