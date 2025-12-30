Return-Path: <linux-arm-msm+bounces-86918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FB8CE8D8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 08:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B518301355C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2872D594F;
	Tue, 30 Dec 2025 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMZPMGh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGW9CEK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDF02641FC
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767078335; cv=none; b=r3obQiK4YaNo4JR5ZUyMp2P3aMMW6rwr74Q/kvC7Fo0bi1QNM+41ccWsddmtmxGvYETVBYynaRzsTlfrfcbSEJH+WWRekYlmggwjlX9Jh+XBaOo3XEqIsveGjIWKEoMVn//UEAsBPLgFt0c9FCPuJoS2l7QlwpU+NqJreYnE5oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767078335; c=relaxed/simple;
	bh=vTeaLtwk+S/vv4xd2A+/GnzT5sIQ1T/mBpGFxSLCcP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rogInbwGoj1HIrhzpyqpJKLuX5Q09pZz63Prw7a0zlD1JXZGlH1zPE/AyxGGf1j3pWxTZXuKA6zfUOl+g1F2Er6qKdfRiYTd8/OwDgnnFp1D5atu3366MikiiiYtN9dNco7TjiaqbBxwZY38p7VD+xXrc07DsRuNCWCscn7HMgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMZPMGh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGW9CEK8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU1UUfK3815374
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9p0a+GpKcnFGU7FQ0mDsnd+V
	AL2s8e+Im/DSSaCccmA=; b=BMZPMGh6/QqfJquy8mK5HJwxw4Z8NHPWqXyeF0Wy
	PQjXBW/1fRHyEM/zWWcDfroYkW/lBHtYr6kSMZoImtkLLJT7Jgjk77ejBp6XDWMv
	e0gaoUPDA7g5RYYwpuDlLqjw9nlJVkeWHlmOoxVZzny/AD7SlByc1O0Pcw8Sx2kF
	cwsXcta+HEgAJxGXzoy0XAhEBaWdnyieleS3O80GXO3s+GU+zHEOvUmj5ufXiPkB
	Gwz7sN9wAcmFyQiY6Num6Y7ZipoVEcuKv4ef0eXhSc5jmhvCdhoUKC+CxZ0ZbJ5z
	4KaCC7PShE0QO2v1+Q6QtfnadN3U9ygkPPCUR9ssUcM9Wg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc8yuqs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:05:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0995fa85so293302381cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 23:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767078332; x=1767683132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9p0a+GpKcnFGU7FQ0mDsnd+VAL2s8e+Im/DSSaCccmA=;
        b=CGW9CEK82+yj4aPMQA8+5OrzsrPiv4gikT3AhkbANW7i6tDuoeTxH3fRWOVfxhwHYQ
         Y+QI21Ff/jbhNT0c1U8mJj6vBlZxYlaqE6xak+PxbrDDoDAysUokTQU6mgx+N0eRYMqB
         nsQVr5vM6vwo7lus3DC/4BYm3Vd+BkvcQxxhS+X8n8v3LHKiEECiIYIuR9ORl3EIH62E
         B07yypDo2z51fJienraZU5umWYnUDj8ZyQT83/x39iYM6GbTiLoQNEXLumkO6iq/WKvs
         JKtxEYkV3t+3NY+cHoAx+lpGWXWg/ik3BDeT0Ee2HciYI0ThKp8d5sFJtsmsgRNUpkQA
         zuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767078332; x=1767683132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9p0a+GpKcnFGU7FQ0mDsnd+VAL2s8e+Im/DSSaCccmA=;
        b=elbWilAJIQk622Hmq2U58ow7ZtV68nYZkiW+ylHytZBFz/70XmZZlCK7njDMcYKFrI
         MgIDwDqYJJU5yfkHQwjDHroPYaSJLwc3WvVnIUv4/iZ2e6NRHeSPX+uiX8GBMq+sLSvJ
         JFZa34w5Dvafj1RUeHYd5b0dETMHz00l8jYGRu9awkNW9QtM2IRyNNDQ6aGMgJfCqPiI
         8VS4hdV43C2hsnf9Xh7wXZoFrg/A0y30hVZVDJtDSRANscLdcNAYeYIujDlrAz/+XR3x
         O6+BVbzRbStYIXr/ydJArRKZRL7DZJZIIp8s7V0LUNngneO5N7+0Veysezf/U2o52o3h
         5rUw==
X-Gm-Message-State: AOJu0Yw8DTqmrXz+TC1VpAZUdPXSRxCdhzyIs6atptyGWt1VlkAgk76u
	WUT501Yf5Gn/w4rkhSRC8LOieQa7cKx1E0jtw76mksGfY0OK1npDHLycwRoNLxN0MoGuaD86Uii
	4DzB7+Di471tdRf3qqMMJh8BC4lwu7gEqeigeVwqZwj0l67NaXaBn0XdaXNcqonb7UEGH
X-Gm-Gg: AY/fxX5aM7sUNgBjrJPglKX1ENKjgmQZ35JZeNUuASwm+OH/vexrR5D+3/3P2oN3Apg
	unAHNUPInkZMlMgSWrD51T2Uxz7hx0BGoAvim145YuUK8XRomwP/2JBldQrJuOr4HTIQZVy35kq
	m6aSHsgeH3ELdQbCHYZNItuh+DMgGb2otcvwO8nWlBWdNlSAk0Pr/0YYbnatD3QC0LZa3rWEWpf
	SXexDJWpqC+bS7n/Ip81M6qyD2IScq0ukbyqLVHk+DXLiGuorxvApA+hLc0eoThr08BzWuDrV/p
	Vb8OsyC5WGSTFMqbBuk2sdxzLZBPdRbOJRmpkLEhmz5Ie7FKA7yZPCrECRC6KwaqQ36KMx5DiuH
	N6I7v2ry7pU6NC2sVeBKRw45fq0jUNvoig6exUCfQSYvgDixYPrLjQ4Rvzy6eVRweB9HhbxDzQE
	h3pV65i0dwx88eR5z64DmOaFw=
X-Received: by 2002:a05:622a:19a5:b0:4ed:da56:7a96 with SMTP id d75a77b69052e-4f4abda191amr514001001cf.60.1767078331788;
        Mon, 29 Dec 2025 23:05:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE01b8kjYquQO4QeTbEqpR9AnjDOOgTrrna4Y9YiMbaigy3wM+DVcm+TFqtcTcwyVCpCKEbAA==
X-Received: by 2002:a05:622a:19a5:b0:4ed:da56:7a96 with SMTP id d75a77b69052e-4f4abda191amr514000631cf.60.1767078331343;
        Mon, 29 Dec 2025 23:05:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5cbesm10344530e87.13.2025.12.29.23.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 23:05:30 -0800 (PST)
Date: Tue, 30 Dec 2025 09:05:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Prakash Gupta <guptap@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <yudvagpfw3tfemvf3wcr62jrlvxfo5yobgsrzj4nechtqdxeu6@i2pfy4ys6qlj>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <bylruidduy2u4lsqlhzmohahgkm633hijffi3s2wt5ojeaotk3@awulzz2qdg7h>
 <aVNf-lZ1KcH3tRV_@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVNf-lZ1KcH3tRV_@sumit-xelite>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2MyBTYWx0ZWRfX6Zn3bmOGpU/K
 iJu53rTnHWdmMst+BDAfYt9eMuct9lAEGfukV/12bjpTDGOkhatYB1w9XybVinHbM2U6VU0oYdB
 mJYeyB7CPbgF9kh1KkAyn926IbwkhxivhoCOOv5Lf/allGEtZrNWtyw0qtvqkk6jPkPUYvJkfa2
 kfO5krxvkUixPTn16ENsVS97Gr5fSqOSZ1YH7d0HRu7YDfNQsu7q6vwF36C1qk7rxuV/jRbylrG
 +OwHYbAN8aU25F72k/3dVDEJai/9KdrpNdUb29/um5fI76aNCWNZeT7Zk1HMA+gTINooYwPMso3
 C4bElZqSCBe74b/S/I2XJhNDgY6Rusw3tPgfngiEg77nJR70fJxrPBeraptY4M/HpYsUJwF57a5
 gFcfMq/R8UzzBPczxN1HpiRbtkyEGcHW9Lxa0T5KaaugWdvRVhGQN0RATK0ccy/dObC7QOA0yYz
 9dT3zG5iD0GW4W+Bq2g==
X-Authority-Analysis: v=2.4 cv=cP7tc1eN c=1 sm=1 tr=0 ts=695379bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=a1r8x7AS_Hu1ar37CrEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: yYNE92GPREWdvjjcXd2VJbOuEyiOqmGB
X-Proofpoint-GUID: yYNE92GPREWdvjjcXd2VJbOuEyiOqmGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300063

On Tue, Dec 30, 2025 at 10:45:38AM +0530, Sumit Garg wrote:
> On Mon, Dec 29, 2025 at 10:00:02PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Dec 29, 2025 at 12:42:57PM +0530, Sumit Garg wrote:
> > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > 
> > > Fix IOMMU DT propeties for GPU, display and video peripherals via
> > > dropping SMMU stream IDs which relates to secure context bank.
> > > 
> > > This problem only surfaced when the Gunyah based firmware stack is
> > > ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> > > Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> > > as a fault by Gunyah hypervisor which were previously ignored by QHEE
> > > hypervisor.
> > 
> > We are porting the underlaying layer. Can we make it to behave in a way
> > similar to the _existing_ software? If DT was a part of the firmware, it
> > would have been fine to perform such updates. But as it is not, we
> > really should try not to break the interface boundary between firmware
> > and the kernel.
> 
> I support your viewpoint. But in this current case Linux kernel VMID mapping
> for secure context bank stream IDs is incorrect. As Konrad mentioned in the
> other thread that for secure media streaming use-cases, it rather requires
> proper representation via iommu-map such that appropriate VMID can be mapped.

Yes, I understand this part. I'm basically suggesting that Gunyah should
ignore this SID when programming the actual SMMU (probably like QHEE
did).

> 
> > 
> > I'm fine with the change, but I think we should make sure that Gunyah
> > doesn't break existing device trees.
> 
> Sure, this change isn't breaking any DT ABI but brings compliance to
> usage of stream IDs.

Actually, it does, as you can see from Rob's email. You didn't perform
make dtbs_check while submitting this patch.

-- 
With best wishes
Dmitry

