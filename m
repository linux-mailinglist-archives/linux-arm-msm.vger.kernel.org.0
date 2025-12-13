Return-Path: <linux-arm-msm+bounces-85134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC226CBA43D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 04:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E5BB30111A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 03:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5911723C4FA;
	Sat, 13 Dec 2025 03:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKwN7cje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvdmiEmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5D199237
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 03:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598103; cv=none; b=QJRDnE4VSjfRsfmqteW5De9laN1zdeCSsIP8fD53KtmtmAQkl3ciU1M2kDGj51K3Xr+9pG2igmIPkX7C/VYS2NJBiGBvwCtE5J2nSncQ2etjHDqI0w46rrRGAko6vkOxEE8SwwKl91j73NUkYg4lJ1TbpdclP3RRZ1V7OKKB5OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598103; c=relaxed/simple;
	bh=WImCn9FzSjj+r9v5eycunV8H6D1flDAfnmUE/i1HfsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paWY0wuOx3mAwHPyfT94OamllhfOqwV7s3Py3qOPrimD8sCamGKX/X43n7eyyhWKBYTrLBMOF4GXcEJExvB+8u84OVxI5Wol5+hjo5eKeQH/hCz4qDKqKAXawAyUHkGi3cTganDbkv3E+YbwFE87cPZPMDpUpZLi1Dtxyi6eDho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKwN7cje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvdmiEmF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD3Z2gg1907858
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 03:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OiRjrMcPXJynpd5t04J8nEqd
	9i5Eho9ROloGYsJJ3xY=; b=ZKwN7cjeOXjqXYkqHDsQtuCTfYI2jh+OGClyIK1T
	IevCp/EFMiOq9DxmiZOP/oIofA5FY6i6zO4vwmMaQr6gfp545qZ2lqdYRWlSScZS
	PuGewRImSZWRjFckbfPHQfLOa1LsZSOi1UsEw8ea03IUwtPylk8s60irbhMxA+OL
	7MClA3JPgy+o9Te6slA0yfLKWykob61WFSfN3DwJL/LX5K75QMx52GHxuH/CwnRg
	QlLLTWNo07TVnw0eTZbzoVFhuyiSfxGc6TWeNS3Iovv7jfsLp40iXXxm50qWBwwX
	sXBr2Qb0JWvGjQabYUKDjtPKjqkEDIPemEa3AFhudPHuEQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b10byr0m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 03:55:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso64262441cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765598099; x=1766202899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiRjrMcPXJynpd5t04J8nEqd9i5Eho9ROloGYsJJ3xY=;
        b=KvdmiEmF6NckHsGaS7U2NOe6c9uMB3BTJEivB7eii4Wnhp0bIEz5p2ItzEFvKNTE1T
         T2/12aon0Lzaz21rWDg+ByHSIx8aabxr13eqHlZmVrX7Imfgx71EujYgoP9EyrjaPm6X
         eZyQRisLqtLkrjGuY8P+S8GQOufoft5jQOvwKp/RSJE6SS64Da34JwfDwxMGThM+lq+R
         q/A7qbPWAUSe4Xgx7HbEd2p/NWGnxQx6+euQbjQQQD2mn7TXTmZTmZYDQ/gsgR+BVYWe
         KIeFD2q1eGcPdvcnxAbOSlTsZFOJqx/lJoIs+8qseiBqAhHSLK0A6uJkrzplESRLmdz+
         6a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765598099; x=1766202899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiRjrMcPXJynpd5t04J8nEqd9i5Eho9ROloGYsJJ3xY=;
        b=m8X5BIKhGHKOi3X4IghBL5IZe+ccE1Dn1wYTCBzdthAe6zx2fl2Tm+lrodyFhICS6g
         +bXNV+9D8p32aRoMY7E4NUUWJutx5qhQfW/ZvWDWEsIxtntq0tOdX1D99z3ZUZwZdTu2
         0vjWWOpMbppjUPKf4DxpYeRPIccisCsFVQw7W5o0Ez0tVRcNNJlGUFgURut7U5ViVZBN
         YT3j1ZaeAwY6YiFw3NKckFDgSocb/157wJmaPlVfAT6BwuZFgZp7EUJJvEP+c+z6Ld2H
         N/AsvCzfWfEJbcJ0VahXMd9drVbdawpy5GNjBxyzNyK+ok3F1inRy754JlBE72DhyCBF
         EYgA==
X-Forwarded-Encrypted: i=1; AJvYcCUtr3noNqIXz+QXGTMEFaO4XkBNm0iG3fXlqwXD2PCTF/eWTReSAD8JcOpgK6xF5lFJV89uvf5HzdcvSR6h@vger.kernel.org
X-Gm-Message-State: AOJu0YxbH2apAudX6BzILXE8WJIskuEAcj440K05u3qIcAGfux1go7Oo
	/bWW1R7ZjaKhwDTLHLGtchEebnTSLHL3HNmRu+qIA8CI04NGzTGKK7bShh6C0p5EUdf+p9ejQ13
	AkT0AuQD3W5ZO8lU7ivP86rxv98+9vWp1Qnuk4Rk1BQb0P71ckTLPdNT3e8oMxs8VxPWD
X-Gm-Gg: AY/fxX5iSAU0X7n8TJxmjzdTT7sfwz/WMPXV6ExYwG4Hjes89Y+QVCPMGxf3WmtK3Pf
	sRj2HVK8HP1yIewnMEgfHhdeVOtnqXvuu3KUr+MfSA45iFYgMAucnX13kv5ZvMGF4P5qwXYK+BU
	bGXL6pgOxIB0oIqaRRrQo91Xz1aZVfCeh1E7kw0fbOpXvVwGNbsl48h0LJN5ISeobVyj0h6/n9z
	Jdnwkp+WPKariglTLfBQfKSE4K10aj15VtBAcBP10gntoJ8X+cD851MdIPFotuW5EUxq9iRe43a
	DqxXQS2fNN83zEyWlIHHNe+9PWc+WXyCkYGBAYgo06xB9yRkedq6nVisqMSwqG6D8yU9sH9yT44
	Z60LDEFEYq+IWDVURhN4NeLAa213XODgxjqTj2NyT9mhpWwdhQ0ja9SPrm4D7/VV+cWNjyt42c5
	5YCg4xLy8OA5JgGSkNRR4AbEU=
X-Received: by 2002:a05:622a:5c8e:b0:4ed:bad6:9fa9 with SMTP id d75a77b69052e-4f1d0467087mr60912611cf.6.1765598099321;
        Fri, 12 Dec 2025 19:54:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8CqPeKor3JPIQUTDPbTmdRuInyQB443I+eB0ZPIvKOo0ZrgoDVqmQF0EARjC9WG/qyUX7Lg==
X-Received: by 2002:a05:622a:5c8e:b0:4ed:bad6:9fa9 with SMTP id d75a77b69052e-4f1d0467087mr60912321cf.6.1765598098846;
        Fri, 12 Dec 2025 19:54:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2fa7780sm2617488e87.67.2025.12.12.19.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 19:54:58 -0800 (PST)
Date: Sat, 13 Dec 2025 05:54:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
Message-ID: <4qgnlilx2vyi6yf73d47z2o342lotq7vsvycigsv5fb3rcwsjv@t4ank62skqny>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
X-Authority-Analysis: v=2.4 cv=IoITsb/g c=1 sm=1 tr=0 ts=693ce394 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1XWaLZrsAAAA:8 a=jfDATOuUeH7LmkgJeJUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uO6bQGiEsIPhkVd4V1HNaDxn41r5XPaP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyOSBTYWx0ZWRfX6iyD9/7WoIcl
 9YIDcbfXwhfm3+Gpk+CijVReV6G2diEaGeZG9rqDb1umrps6qM1a16JkFp31dPOLw2Gjlzt6clQ
 kKBa/NOgrGOA+aCBlFGCGLQ7P54HFqJoa1eY5Fqv7CtC5T5MkNa+r9DnbuBnl2CxxDjd03lE6LU
 5v5DtO7CfJq9dj95wz+wvhvbtAs2mcnCyDRnqpZbrgIFoA8BYm1e/x+CkhPAQBX6eud+EPp+b6X
 D8v5cYUW9cTzW+JuJO2zRKLSacaxX35FT0eiQhOVyJsERfN/Aktea1mowDZJzisrrCuVMeaolc2
 0uEbaJUlnaOjV8b9c7H/RrR7nwVNkpuZwp6JB59NIoFojnhyeyy3W7CkMVVt3AHvyxvNHqnRfv7
 Xc0PbulL3QAeaTfrlWAKsW3tOP7nmw==
X-Proofpoint-ORIG-GUID: uO6bQGiEsIPhkVd4V1HNaDxn41r5XPaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130029

On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> bindings.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> This patch converts the QC socinfo driver to Rust, intended to be the
> first Rust driver in Android that is owned by a vendor rather than the
> platform.
> 
> This driver is currently quirk-compatible in DebugFS-exported values. If
> the maintainers do not believe that maintaining the exact formats is a
> benefit, we could simplify the code further by dropping some of the
> custom formatting functions used to match the output.
> 
> I sent an earlier draft of this privately a while back that was much
> rougher, but didn't get much feedback.
> 
> Now that we've got all the interfaces we need for this driver reasonably
> available (DebugFS was the one that took a bit here), I wanted to bring
> it up again, this time as an RFC. With the new features, the only place
> it needs `unsafe` is to define an abstraction over `qcom_get_smem`.
> 
> I have tested this on a SM8650-HDK by diffing the contents of the
> exported DebugFS and examining the files under /sys/bus/soc/devices/soc0
> 
> While I believe I have everything correctly exported via DebugFS, I have
> not checked equivalence across a large swath of devices, only the one.
> ---

> +
> +pub(crate) fn qcom_smem_get(host: i32, item: u32) -> Result<&'static [u8]> {
> +    let mut size = 0;
> +    // SAFETY: qcom_smem_get only requires that the size pointer be a writable size_t,
> +    // host and item are error checked in the qcom_smem module.
> +    let err_ptr = unsafe { kernel::bindings::qcom_smem_get(host as u32, item, &mut size) };
> +    let ptr = from_err_ptr(err_ptr)?;
> +    // SAFETY: If qcom_smem_get does not return an error, the returned pointer points to a readable
> +    // byte buffer with its size written into size. Because these buffers are derived from the
> +    // static ranges in the DT, this buffer remains accessible even if the qcom_smem module is
> +    // unloaded, so 'static is appropriate. The underlying buffer cannot mutate, so upgrading it
> +    // to a reference is allowed.

This is definitely not true. The smem data is ioremap'ped during
qcom_smem_probe() and will be unmapped if qcom_smem is unloaded.
Accessing such a pointer after unloading smem would result in the
exception. Current socinfo ignores that and keeps on accessing the data
at runtime (which also allows it to read DSP versions which are updated
at runtime), but the comment needs to be corrected.

> +    Ok(unsafe { core::slice::from_raw_parts(ptr as *const u8, size) })
> +}
> +

> +
> +pub(crate) static SOC_IDS: &[SocId] = &[
> +    id_entry!(MSM8260),
> +    id_entry!(MSM8660),

As we are performing a linear search over the array, would it be sensible
to sort it?

> +    id_entry!(APQ8060),
> +    id_entry!(MSM8960),

> +
> +pub(crate) const PMIC_MODELS: [Option<&str>; 92] = {
> +    let mut models = [None; 92];

I don't like the magic 92 appearing twice here just because the last
element of the array has number 91. Is there a sensible but idiomatic
way to express that (note in C we just use flex array without the size
and don't specify the size at all, so we don't have the duplication).

> +    models[0] = Some("Unknown PMIC model");
> +    models[1] = Some("PM8941");
> +    models[2] = Some("PM8841");
> +    models[3] = Some("PM8019");
> +    models[4] = Some("PM8226");
> +    models[5] = Some("PM8110");
> +    models[6] = Some("PMA8084");
> +    models[7] = Some("PMI8962");
> +    models[8] = Some("PMD9635");
> +    models[9] = Some("PM8994");
> +    models[10] = Some("PMI8994");
> +    models[11] = Some("PM8916");
> +    models[12] = Some("PM8004");
> +    models[13] = Some("PM8909/PM8058");
> +    models[14] = Some("PM8028");
> +    models[15] = Some("PM8901");
> +    models[16] = Some("PM8950/PM8027");
> +    models[17] = Some("PMI8950/ISL9519");
> +    models[18] = Some("PMK8001/PM8921");
> +    models[19] = Some("PMI8996/PM8018");
> +    models[20] = Some("PM8998/PM8015");
> +    models[21] = Some("PMI8998/PM8014");
> +    models[22] = Some("PM8821");
> +    models[23] = Some("PM8038");
> +    models[24] = Some("PM8005/PM8922");
> +    models[25] = Some("PM8917/PM8937");
> +    models[26] = Some("PM660L");
> +    models[27] = Some("PM660");
> +    models[30] = Some("PM8150");
> +    models[31] = Some("PM8150L");
> +    models[32] = Some("PM8150B");
> +    models[33] = Some("PMK8002");
> +    models[36] = Some("PM8009");
> +    models[37] = Some("PMI632");
> +    models[38] = Some("PM8150C");
> +    models[40] = Some("PM6150");
> +    models[41] = Some("SMB2351");
> +    models[44] = Some("PM8008");
> +    models[45] = Some("PM6125");
> +    models[46] = Some("PM7250B");
> +    models[47] = Some("PMK8350");
> +    models[48] = Some("PM8350");
> +    models[49] = Some("PM8350C");
> +    models[50] = Some("PM8350B");
> +    models[51] = Some("PMR735A");
> +    models[52] = Some("PMR735B");
> +    models[54] = Some("PM6350");
> +    models[55] = Some("PM4125");
> +    models[58] = Some("PM8450");
> +    models[65] = Some("PM8010");
> +    models[69] = Some("PM8550VS");
> +    models[70] = Some("PM8550VE");
> +    models[71] = Some("PM8550B");
> +    models[72] = Some("PMR735D");
> +    models[73] = Some("PM8550");
> +    models[74] = Some("PMK8550");
> +    models[78] = Some("PMM8650AU");
> +    models[79] = Some("PMM8650AU_PSAIL");
> +    models[80] = Some("PM7550");
> +    models[82] = Some("PMC8380");
> +    models[83] = Some("SMB2360");
> +    models[91] = Some("PMIV0108");
> +    models
> +};
> +
> diff --git a/drivers/soc/qcom/socinfo/socinfo.rs b/drivers/soc/qcom/socinfo/socinfo.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..bff1bf8fd672e3c461352075aa85ef8fdedff953
> --- /dev/null
> +++ b/drivers/soc/qcom/socinfo/socinfo.rs
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Google LLC.
> +
> +//! Re-implementation of Qualcomm's Socinfo driver in Rust

I think this comment can be dropped. If it gets merged, there is no old
Socinfo driver.

> +use core::fmt;
> +use core::fmt::Formatter;
> +use kernel::debugfs::{Scope, ScopedDir};
> +use kernel::device::Core;
> +use kernel::module_platform_driver;
> +use kernel::platform::{self, Device};
> +use kernel::prelude::{fmt, pin_data, Error, PinInit, Result};
> +use kernel::soc;
> +use kernel::str::{CStr, CStrExt, CString};
> +use kernel::transmute::FromBytes;
> +use kernel::{c_str, pr_warn, try_pin_init};
> +use pin_init::pin_init_scope;
> +

> +        let versions = self.versions.unwrap_or(&[]);
> +        let versions2 = self.versions2.unwrap_or(&[]);
> +        for (version, image_name) in versions
> +            .iter()
> +            .take(32)
> +            .chain(versions2.iter())
> +            .zip(IMAGE_NAMES.iter())
> +        {
> +            version.build_debugfs(dir, image_name);
> +        }

I like this idiomatic code, we even get what original driver misses:
size checks for those memory regions.

> +    }
> +}
> +

-- 
With best wishes
Dmitry

