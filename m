Return-Path: <linux-arm-msm+bounces-84749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCCECAF37D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 08:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAC58304C296
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 07:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5098A2BD033;
	Tue,  9 Dec 2025 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcTakGmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzhM34Dn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4B526CE2D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 07:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765266729; cv=none; b=j/zNH3ZNlSeRTI7H39umqV1iOdU/YygyKi6AoQJ4aXbIvSDG8oHKEZsHyQ3Vr+9t+XX5MSBQcFHuCO5hzjMhBGU7tWZWXk7mxKxIKZ+lZDLbFK70AepJe2Vyv1WgxgQaIYf4Ixox77xq2dzNAQKhzm70Gqlro0sdx8j5grUB+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765266729; c=relaxed/simple;
	bh=Jo0KNwOuAvHZHm3ybRcsjpTi+h+SM2mwW/Q5Id5nh+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4PWWljiq7vZIW3Bk1j1Pzc/zKpm8DRvFi3i8Aa0GonB2TbS9DQ56o3WoK2yJ6f60ztERtsiA8mo+lMAvxOmI/DjMHHSUkrm1unjWkcQydhVFNO/Wgqfa5jDc6sI67BWY6eu4XIGkj38/o0KZHbp2CgF5CGuBqCNOQ88trIZDNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcTakGmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzhM34Dn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NX32L1499027
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 07:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=thXUIE0ypDaz2hZFVr0gvvZE
	oNAbwUD76GBmxiIRQ/w=; b=EcTakGmYoOm4/AC2Xcvid9GZCIx+DuVjCuLqrJTs
	mtGu3+g1wXCr1vTY+xLqLX++kU5/r9bMLgZVyPirb3V5+t09TYIPIBBhDjsqphiO
	DXOjRq2pWRvE9BB3XHBVFmXBT6yYPVqZt1Ojaz4wQq9x6oSTgYYS85xc68mNE8bn
	fBrtR/BItB7tnQQTx2PLGjn+4iS89TL90UK4fbA3jYOxkJ3Mw3qtor+0hQfpW6zR
	U+muVuaGrlTqU47Y047TGMmwo99xefti1ZcqHTkmcRlSx4vf7tOYCCYRXOpbCYSI
	DpXxyBh5pzw8UXa3wRc6URyYcCOZPnt+cPW6RARU4oc87w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax57r9q9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 07:52:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee3296e984so99750181cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 23:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765266725; x=1765871525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=thXUIE0ypDaz2hZFVr0gvvZEoNAbwUD76GBmxiIRQ/w=;
        b=PzhM34Dn9eTWgzMytRQ/YI+EYHTfD4ikUa1nt0Z4OXe/WiKjVYkzKiBvxsVuv7amf1
         R3R1brQZ3f4P52Q+VZzvv8DXosFoG3GvtmzQEdOHdGP6CBhDBL0OrYGg4LoFmeMzhhgf
         uRizVb69Qbnodq2atEhYCJ4BLtVJdWc4bpK7AHP2QKfnFKYX97O/zenPcINsQd/MHQy8
         vDTrCyKPeWZ2U+X4lb72OQxTacCs63b3gko7o8zCQd4lmEPwH8o4Jb1x4bHnuRT5FQqC
         bRb2xU/RHWENZxF9+wcMIXHhULM2wq5+XghK7MTG9+NeVUp9o5JwePcCOcJ6yj6+fN7s
         p5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765266725; x=1765871525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thXUIE0ypDaz2hZFVr0gvvZEoNAbwUD76GBmxiIRQ/w=;
        b=FFnSqVG0nROoGGB4xOauOsqedxiMYVpceUqCVWGc/M6hRm+qWiStK1f9+axnMKwFm2
         r3Tjl4bYApgZXaOQtUdU4ShLRKyhX3kLtP2my0UOj4Wt21DJpf3OxWOGpYuwiizeYkAe
         J5Vc8dDyDCcpZBEXR/o2jhYi10AlsfvBPuJawMCiEpMWYkUWb0k9+sb1pJknDGHKVkih
         Iro+QS9xHZuq6Rrp0trY5BHPScEzc2rIN5FdCBwyD0sCpH0PRwHTbr6JiXmalZw5BKGh
         wXCGRDyg5hpIYFzWnYzBfIcWfI1hW07d5jjkHbqvsyH4YQlzzfPpcDWXT65BTw5wBMpC
         GOHA==
X-Forwarded-Encrypted: i=1; AJvYcCWMyxS/dgwW+GEaxyMljZ7Ik6luwSPZ6mQFF1YamCJlB2qjew7MC+oqk2QQYyrdeFgxzXQOQlCiXmO6M66A@vger.kernel.org
X-Gm-Message-State: AOJu0YzUlqzu1f6EzWNAdI/D6iFTJ38kxhjXQBbjqMBBh58eA5CEO76a
	2uqYLRef/bVrJVqw39N7253DOzIcgiozvYsa2wyUdHMxtCX3palmUT/+xp7IjEEClUDk8EKwryU
	47Vrl5zdqqr1r4LrTdkWM7u/Ekf0MK/JRkAlrCT2c4L6jXz5I4T3wIeVr+xBtG97gtxM2
X-Gm-Gg: ASbGncuC89jbCLd8nmAimYRpg7R2r/ocs31grSlIjECNE4xg9qZ04PaOnrNgA0v/FUE
	ja6Slcy+Xq6XQBq383XskW6Tsxt2+M3PgLFAc3pyzNl4bhFakw/ZIMqPMxyUrPQ+jzfABG07QFC
	IhSQnP5JWC3yV/sq8KjAP/9q+2BBaAym12SbvhkxFIjZT/dGKxd/uYs4viXRrf4NztggakH6Mcx
	y0dWJDRaPycCbUNvY0dk/5dps96oThDlxpnX6hwzjxo4SlLnDspDtXIkUN/kSa5qYevmvlCOXqp
	eEcRLxJdIi+1X3kTyrPf1fds1Vs5Ei7gNpGRNNDOO0rjRYsa+Y1c8WGv0UfBjfNo2iBrZxu4vtL
	MWEipsrbjtfDSTIa/oQVLzx3xbkeCAUnVouOwGO5osOFXhRmYRwp/w2Uo2zHa6hWdUgUBax2PAS
	dS18QkTUv6HCo5MnJ0zBKZj+w=
X-Received: by 2002:a05:622a:28f:b0:4ec:ef6e:585 with SMTP id d75a77b69052e-4f03ff24e98mr159755771cf.73.1765266724889;
        Mon, 08 Dec 2025 23:52:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDUM5l8kB+uO6MkZ6BGAVtrP1ecLHKzFiBvLvOe3sQnwHX62o4yX9FUqygySyscF4j8ToQww==
X-Received: by 2002:a05:622a:28f:b0:4ec:ef6e:585 with SMTP id d75a77b69052e-4f03ff24e98mr159755541cf.73.1765266724451;
        Mon, 08 Dec 2025 23:52:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2a1sm4970743e87.64.2025.12.08.23.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 23:52:03 -0800 (PST)
Date: Tue, 9 Dec 2025 09:52:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator
 support for Type-A ports
Message-ID: <6awlcjah2ajwzxzdvoch5e3vn2ztvxyjdbikffhp6efti3f4wt@swhugoqsmf6z>
References: <20251209041701.3245452-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209041701.3245452-1-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OPQqHCaB c=1 sm=1 tr=0 ts=6937d525 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VfrTVM5IFoUUBtdl8jsA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA1OCBTYWx0ZWRfX16Ktfp/dnmux
 tRZssjb197SJhaXVkbSRBoHhHaFTqpsSAaKw5YB34IB5OI4JZWvTtn4Ex4NrvcMN46MprS8mJG5
 FM5tQtxpJyDXr27B2xeythF5+SSLLpuUkMHrbKlyz2Cbxz0TTeR8kv0Xcd+7MSk4EvHJJbMF2OV
 b1BvBHk3sF/HgHdK6z27tAS5Qua3TjUOAYfhUMB0VEFQkNwQ0AH17aPWMVNxVtQIxKKE23eJNZg
 0efUe2irQ/x/W9lyat8WzJihqUy9Ir0D42og8J0LHM/tn6ltpVtd5u1oT2trmnLJYtdkM5zwXmz
 BzCpxl25yNH2v6T/qsNLyZ14Ll2SQJ+yxmVg9i/ndrItZ5JG1ylReWhqlRDrSqaScgOyKb1LgP+
 bGB7Jqc2VxOcwvow5WHTmbWyyTQo6w==
X-Proofpoint-ORIG-GUID: hGVK5gdo8Heo2NfmhvrVkd_o_UGZ3WiO
X-Proofpoint-GUID: hGVK5gdo8Heo2NfmhvrVkd_o_UGZ3WiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090058

On Tue, Dec 09, 2025 at 09:47:01AM +0530, Krishna Kurapati wrote:
> The Multiport controller on Hamoa EVK platform is connected to Two Type-A
> ports. VBUS for each of these ports are provided by a TPS2559QWDRCTQ1
> regulator, controlled from PMIC GPIOs.
> 
> Add the necessary regulators and GPIO configuration to power these.

Should this also include corresponding USB-A connector devices? See
qcs6490-radxa-dragon-q6a.dts for the example of how to describe them.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v2:
> - Re-ordered nodes to be in sorted order.
> 
> Link to v1:
> https://lore.kernel.org/all/20251208085152.2597818-1-krishna.kurapati@oss.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

-- 
With best wishes
Dmitry

