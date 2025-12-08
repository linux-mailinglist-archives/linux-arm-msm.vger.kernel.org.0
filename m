Return-Path: <linux-arm-msm+bounces-84693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E2BCADC26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 17:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 744DD30146EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 16:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E6D1FE44A;
	Mon,  8 Dec 2025 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4FaYQ6s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPBpbi4h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF21E1A33
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 16:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765211589; cv=none; b=AErb4Tja+FnL/fri4IhQyMinlB7o/UHHKo/931gVtXl+JY5m/nygnA8FUR2uUIPphSdt1YWfWgwNR7IGQOekyDBiTrzczadq1zPcFbFQGLbEEmImKuR0qh0f1nh7R+Pkp5TvIyX8qHJnHSwHgqzsEu+aEYfE3PaJZDGfp/vSLkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765211589; c=relaxed/simple;
	bh=4kP2/K5lTTzD5c1dfUscOl9B3nFR54A29c9lPCoqrmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=om5D1ty17RAmKhgzpyaXc6YXkjdDm78ZPJS6diSuUqUXw21hgLaxnapOhONGKSJD5g2mZmB+18X14GT9vYm4EC8kcpIMYQvIpoMhSKsfjFoGxFZ5eG0KfDJL+NSsfNJOsT0MKI+UxMwDgQnCOf1hK2T8ZQPATL7zSj+4l/gKH7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4FaYQ6s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPBpbi4h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88aKEQ095771
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 16:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0jPCBlDjyAGHOYNhm4qqz3KwSpK2g+kV3CwXvtWt40=; b=Z4FaYQ6s9cH26VAe
	IdNsMvVHL2UGkdyfjgaRROsDKQqgEErjrGw8b7Vyu5dwyfvg5fSnuOuSERj+riND
	WkyDFel2arRlNzwuRGIKdXJk87UGs4HDmr6IcgwSDundcOIosM/0D31207HmZh08
	Ip3c3Tpu+lHn8734L1/enuQbhSXBqcRJGeGWp0lR9b2C1I0Jg2WhJpCvplQliYYk
	Nb6poajnBosed72iayww7YCXAd8vQXPPViifnrp2gl1Sl+JOsbyD6//co4koj6IJ
	Ixb5K3LU5CC10eayYWXLZ37tpuqBwagvAhLfZFCc5Bn5cbxsmf4o0/0v1+DbwRkP
	nW8MJw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awuafsd2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 16:33:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5dfd5a5052eso430669137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 08:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765211586; x=1765816386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0jPCBlDjyAGHOYNhm4qqz3KwSpK2g+kV3CwXvtWt40=;
        b=CPBpbi4h02TrjJ6QmamVto3FASF+B7qy3iXUFzUfj7OAvdCpokDjMi5guF6YIWtE7j
         kY4oKZz7Qm7YiNEBK91Mc21ti748bZsV9n+hAcWJa61BZqNtrIjzT72BgTbwATW8iKxZ
         QtYLJbtLZIgz9MplsT/oEsCGrQM6F6gN1GwU0m2bshk9Py72LQD29cL3Dj9i1L52F3mn
         dKAxcIGHmAjgzRtTcBZMPvgJiGmir0VUQtdGhJmuu9vWCV8T3Dy9c16luPIOEQAlKZjZ
         fA1eE2qbR/aePFxEEO6vlc3UkO4vsFhnnKKO0qI3PlwglsWqTWfifA07/d40n7xJIAXo
         8C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211586; x=1765816386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0jPCBlDjyAGHOYNhm4qqz3KwSpK2g+kV3CwXvtWt40=;
        b=P56FW56waS4nZZYw6jTwyI/n6J2McsLD4Dmz7Emvvq7meX+bRdOFWIgt+8MHFfgsOU
         cSSQfFd3lE6yEVKaLVBxY/28s2SBfnKyVpZ92dTKDdkGfxh5408eYRb5uN2NTQI+OBQ6
         NEL1sMB3bu1KsqzPrn+W7Wl8MxPR3kZOnlPCQQXBsrFK0VFrIuKDLPMA1x+h2z+fPpWV
         5mm3h3e5v90aYs2joj9ZvvVg7PzDXTfy51O5781fsHG14x546Tkyc5mn4bjkc77OQkzr
         de7G/JWdAnyA+GqYsL/D4dfkTOzhLn95TRqlbCDf87yJ5JpHA/UI4iPBC1WxH5XZfNLU
         VU5g==
X-Forwarded-Encrypted: i=1; AJvYcCVKEZqtn+Vs70lYzifgpBhVPxtHZY3guhDJgaa0PxLU05Qmpx1iq+Jqkvp/7mUp++1HtFqXKBYRNTrjPVVZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyCHcvmpTaKFb7aG1YpkM8i2+D7IV1qITGZKHuA+bwJUOKvSIfL
	WrekMShP0knXuUROFT6F45BcC+/c7N3Waq8DKUZcRiTP2xD/61lCngXwLwpUEcZSUeMdmK9evi+
	nqZbEJayrOzOi2sK6V+5bFCZ7Yf04bqrQ4gEoTQDLo6uZDxrGb65mRoptElhYcaLTeYyt
X-Gm-Gg: ASbGnctVpgLHFwKzxiGf5hi+JMWZ2Y8TlW5DGe+giznnsMxX6fqQAgW1nFrDfGhhyq2
	WA8MBS8ZLmpjJsXOK0YQlE2BhLy2kr27EriwqVtkrL+4vS6lhNi7tRmZ/RcfJQhG9LxfBWYe9on
	M0jCS8UkUsK6GSEpzIoEGUt5Xfttr19h+mCap+6jp1MJDkUcnr1aR/iEhdxGVF8Wmwmox21+t4C
	eJeng9XHpkuEdUimbvQinsVEFVVB4kxZIIksSdpWunYI4EaX4Zf9uf2d+2qCc/xK3ammIzk+7oY
	3wEbtezfUmqNSMAOewxnMMp0CBL/qkZnLJknO6kM/2CCwxSm9DqhdaXALcEog7dF0+pMgCeN8En
	WcyfUAMvGHP8YWs7Uu+wr0Drkq3Oo0DOyzrvZImtd9dBk/ZAfyZ5EClzjze8LKqi6dA==
X-Received: by 2002:a05:6123:590:20b0:559:965e:f563 with SMTP id 71dfb90a1353d-55e8456e09dmr922447e0c.1.1765211585537;
        Mon, 08 Dec 2025 08:33:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6DtAX4O9dA9blwgNCdrieGjzAXE19KIk9bTjGIhWldGNpRwxj3DsIOBUbUO1qZ11wI5CioA==
X-Received: by 2002:a05:6123:590:20b0:559:965e:f563 with SMTP id 71dfb90a1353d-55e8456e09dmr922439e0c.1.1765211585091;
        Mon, 08 Dec 2025 08:33:05 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49a898bsm1146957666b.48.2025.12.08.08.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 08:33:03 -0800 (PST)
Message-ID: <d81e017e-e317-402d-a4bf-7ddfa033299e@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 17:33:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Re-add cx-supply
To: Luca Weiss <luca@lucaweiss.eu>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251207-adsp-cx-fixup-v1-1-0471bf2c5f33@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251207-adsp-cx-fixup-v1-1-0471bf2c5f33@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ep7SD4pX c=1 sm=1 tr=0 ts=6936fdc2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dlmhaOwlAAAA:8 a=2w06CcI7I7z3fbE2fRcA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: HDg_6dTqQm3YI88HCF8ej8LO8V_YLOyu
X-Proofpoint-GUID: HDg_6dTqQm3YI88HCF8ej8LO8V_YLOyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE0MCBTYWx0ZWRfX3s24m44e8Ds5
 2d6bPVsIZpul7CAPe9Jj+HOxG6/9pXiO+S8OkpQ/Vr742tL6vGdXoZQq2OwWB4kwn+sSTL9HjcC
 jmNd27nGeQpDEQT0wMeDidjwNwVJACKt3Iz8IBVPeHvCSnHVs8MiXaqYpMZXvFS4mgDulyX6A8X
 17a0d/LeaqzsAOwU8jsksF+5daZ2OLebr0YqKfpXBlDJwz0wzbmkVcELW8cduGsi9YaTWYhy4iY
 BPJ9fx9h2rzIjTepWKZRzU0YD/RM741PVTyC/bjIPa6Bq2IbbgZkpW14F0nAu2ctpMq7uQYcVCF
 /GjlsAW/rZ1B8i6Nk7Wen/lnxJIQRkp0T70aWVIwzEwTrBbInkA4myPjBWnP4cgrI09Z3gTUbyT
 S5aAmc+w1ZMoBySF0QfbPxXXoVVzgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080140

On 12/7/25 11:35 AM, Luca Weiss wrote:
> Some boards (e.g. sdm845-samsung-starqltechn) provide a cx-supply
> reference for the SLPI PAS.
> 
> The Linux driver unconditionally tries getting "cx" and "px" supplies,
> so it actually is used.
> 
> Fixes: 3d447dcdae53 ("dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain")
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> There's literally one board using this upstream, judging from that I'm
> not sure this is a misuse of cx-supply or what exactly. An alternative
> to this patch is of course removing the usage in
> sdm845-samsung-starqltechn, but as it stands right now the patch under
> "Fixes" introduces a dtbs_check warning.

FWIW that's likely a hack (because IIUC it needs to power up some
regulator for the sensor devices to work) but that's "fine"

I don't know if there's a better way to handle it though.. I think it's
a board design "issue", since the DSP has access to some GPIOs but it
seems like that wasn't utilized

I'm open to suggestions

+Dzmitry-the-starqltechn-submitter

Konrad

