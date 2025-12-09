Return-Path: <linux-arm-msm+bounces-84796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9F1CB1026
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 21:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F5E330652D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 20:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C47B2F618C;
	Tue,  9 Dec 2025 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goz/AY9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiV7ALW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD831A724C
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 20:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310888; cv=none; b=bQ2FgQiZHLIVTJ0lF7MK/fZZzRR1nzahxl8hEec8pl4z7j84DlueER+LsZyIIYvfQWGkWdJulYm0PSWmSQOJzYiBtswvWBWf/RbtvDLj4uLJTScrLeoCRd8YU/SGILoyENYkDpsaeGvCkijejj3GJBRGG4JRVnj/zIZWNTFkwvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310888; c=relaxed/simple;
	bh=wd1/D09aFtkoubefla+BuIbGHSDlGcOOMs2R3N5WJcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUAMP+ttW9lidKTJvn7Pv3JqwVxEgyvM261zJxGG+4OiB0C1nQUhbziWvFhkBqqF7ecigXHWHX8bCNIHapdSYjDxh3v+U0LnSPeQ8g7yvhpO8YDzXu2yjNERaqMHt0iXh+iOwI5HbCowcPuW7Hyd3GRKFK2WCi8DLWDeWsRX7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goz/AY9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiV7ALW7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9GifIi411981
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 20:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rhsdXjDD2SzcoxNnGzHkJYEV
	oJZYmwyrxp5W0gC1w+o=; b=goz/AY9W/srUmNkmLkRkNh78IL2FIwGuZmFuxbUf
	AbvDiKCYpygbm9CQ5aQHxFYcHers64Xtw+WDOTK+XVlzP8GRQ6ySC2ovrrZkkERy
	CPHYB4E9qYBr2x1TRoiT3DvX7gK6R+gWmyOAAIzGNkF9PMEmOTfNDg3lMk7u0ky4
	79ENYlSk4t4bV0hbn/U4DT9IpTrel4x/3JYIjR3unnCHZrRCfffBpdlMy3z/C/G0
	/DUsirf+EklCbdInz5fLG4/iE4L/QIxhxj9Hgoy5g3pDlTjX7G/OcH21wWo/FGPP
	6vVrBZ3qBVNtm8HEUOTqegmUgBLkJBoJoWJIyvM+82Dq9w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axnpp91rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 20:08:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed79dd4a47so137669561cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 12:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765310885; x=1765915685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rhsdXjDD2SzcoxNnGzHkJYEVoJZYmwyrxp5W0gC1w+o=;
        b=EiV7ALW7eFlz+5NvTAoTOdH1VH/SYVertMR9yeW58BNF1nNTHTCCRz3dNM+lViY4X0
         GMTkczkf8BlPKypQJXykm8GmSM+L2aguqnzZ2qGu2wMcTXUU1eazS7EdAVFRrB8SABdy
         nySbgh0IPfj0kGZW+dr2NMQhoo2UE5+4PNOSSB+CjNosD0XcXJRZi4uCuk4QRMhvBHA2
         vGJczUuGfn0qrX8jscGvkwF5MrWHZSOJeM/ZdarBk2FINhm4r80xwe1t5FnvMzMPgFsA
         QNDnIJmTmv15VFDDpibvlRhWxyl8+dhUksPWZhg7CT18H/PATf8TzLwPS220moKUvpMH
         LMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765310885; x=1765915685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhsdXjDD2SzcoxNnGzHkJYEVoJZYmwyrxp5W0gC1w+o=;
        b=WgD4BSTiQ1R4m0cBjhOJLgmmT87S4XBx27SwxjFPo738UDDvQsZmvbufqSQquzlW7V
         yiMt2h/D1tFlZAGc1FC97xNwYGcO06cjf02NPoi1z9YiQRlo94vyfZkZlMmYMqnCXYsR
         lrPy/DQw2+OXqvIXZO+9FriD5UvNPc975bt/R3iDh3G1E3HnlbsCBUWuR6b6p9QMlJcF
         cFPy/SqW2jZAPXFun6uwjFmNVRDGRMnj5mov+4e/NiT3yne9xrfnptNBgfR7mPquzVHA
         qB0ETUFPKjGTVez/ofOEibm9QTWY0cIWMvuvCNNYUDABAe9AspWEi4oWjSZS6JbURssW
         xxxg==
X-Forwarded-Encrypted: i=1; AJvYcCVO66ZWnvSn0doLpD4njAkAsdwdryiio+k8fzWVFM/fbBlzRq2FKKsEDdpllK/QwE2g0Ds4pank5HCUmBHJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxrDRiq/h2myDR1WKjehhX67AFBft6/vfu+u/JNxwfPhTq2zprc
	9ZNScc9wLfHiVI3kcvF0xsSZ9bbxCsAG20jwLFrVc4R/Ko5Or9gjbbfEFJLnVcaMKjDyMy6Po0o
	/j4t7rLZq041rO79zfu31zoFwwfv6AAbMkXe1vjSgVLY1WidA/W3wR9vXo54MFolTIHZX
X-Gm-Gg: ASbGncsdpusk0mN4IbMKmYLyafIC66r/YSWwyy+4s7LBHyM4PunLuYtlqQvevxMloFK
	9COAp4k0DGJr+dkV6ZkZDNR28lfzGohK/34xBZdbJ8R1eZjtFI0M9nWWmvG7GwNy+R/QODMjGnJ
	8aaEP+cD9QhZkrIGzjm907mfEtN+MA0WdRHjKG0vNXSwc9XaR9z/4lQLX/fJTNlSlutQEBdVXS6
	A2UekKfWVjJpr3RG8bAwFTmMBbxsw9mtd15Ye3Gfd75BWl5bsOlljUmSm+5fVp1kIKLda8H/Cr3
	PC2pnVo1EEf7SbrrDYmW6A1HFVHcsz2wJXO7LON3dU+/yBBEb0njinHQEILbKyeVnGlWRPhsu05
	WBoxFO1X9IyrC9NIzD0wCOn0Db3VEc0yGJV/QQ81tzvIvM9lWbvTx7iKdmzE3iZ8qbI0fKlfL4G
	nVUumfQQtInLb7LwnsBjWWiEk=
X-Received: by 2002:ac8:6903:0:b0:4ed:6782:12c4 with SMTP id d75a77b69052e-4f03fe31fecmr177539221cf.33.1765310884889;
        Tue, 09 Dec 2025 12:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWX4SoovkEdzKr8A8RkAVsUv0ot7k6WtZTT0c1rlSD6/0b1tucveK93Jyw/VcNUy01sU6lWw==
X-Received: by 2002:ac8:6903:0:b0:4ed:6782:12c4 with SMTP id d75a77b69052e-4f03fe31fecmr177538661cf.33.1765310884371;
        Tue, 09 Dec 2025 12:08:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c2e2c9sm5388761e87.89.2025.12.09.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:08:03 -0800 (PST)
Date: Tue, 9 Dec 2025 22:08:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Enable cpufreq cooling devices
Message-ID: <a3mzhjs3kl7yfrar3gh6p3benvfa5bx22xwuznaqlhyytlyxkj@r5p3vfd3ykde>
References: <20251208114558.2343462-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208114558.2343462-1-gaurav.kohli@oss.qualcomm.com>
X-Proofpoint-GUID: cgluOSxcX54f2rnZM8GR1Ae_kyjMkKyt
X-Authority-Analysis: v=2.4 cv=dciNHHXe c=1 sm=1 tr=0 ts=693881a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sdudbG9VLmQq8Pjc1rUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cgluOSxcX54f2rnZM8GR1Ae_kyjMkKyt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE1NCBTYWx0ZWRfX1FvucnbfA0mr
 qwabhOzofGvim+dyd/oeo6INOLK+PvLy30ibiBzGTt/mnoRGKLM/N+NAI2GfhCDaezO9+y0h55g
 VOlKD34fDkmNs/iLUQdvj1sU2FA2RwC+4UXCigM1sS2WUkny7gwTIDELGCic2uGDb1GdsDpYqJV
 zeWVUsekWBL0KkDWwZkds2xQQd7ZjARTeYe9heU55Oa3pCoFvh7w3qJ0XnEMOgQKrXpe9JdAD84
 Z/baxAHpKfLA+zjSsuL0GufzVHOW2dPnHIgDZLCh6A7rcZWwu+cSr0KGKlOA90/Zm2KOFTXeHTi
 2C75aJS78uzD4Vf/R9L/ECh0dDbUL6Zowh2OnweMWW4T3EAhu74jyMIU27i/qOASAyS+0yuIWE5
 fnaVbJIWnCzI7+A84B+UN2bEAg8ZvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090154

On Mon, Dec 08, 2025 at 05:15:58PM +0530, Gaurav Kohli wrote:
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Are there any cooling maps to be defined?

-- 
With best wishes
Dmitry

