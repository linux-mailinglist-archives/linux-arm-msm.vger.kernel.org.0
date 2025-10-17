Return-Path: <linux-arm-msm+bounces-77684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 774ADBE674E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 576924EE54D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 05:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8C330C61F;
	Fri, 17 Oct 2025 05:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx1e8HAF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C4D223715
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760679837; cv=none; b=u+b/2i4z7e3kAVOoXpJr/TlMcVxekr0Bwh8P1+7E+CKHfrf6yIt0wqi54bRvyl7fh4OJEx5Ub8jSJOsBXCioG8yeCCrc6sf0wSrA2+fEoWrmv4iZqQo92hCJR/c5wD/A3d0+coSPFkf34ux/VOYELVhEa+MRtj8YEV4r8Wt1MJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760679837; c=relaxed/simple;
	bh=fnigGc0tuE0Cu8RTpydT8F42NNAM0ID7srvItgLzc48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyjwWgsjmWOIsYjyNtQWMjyQ+YwsT2aA91TM9Xy3xQ5HSbffGtm6K+zPdLmqa9bNnhEc3eJCLZr14dNHmyZipW+SqmuG40hGaKnX456wy7pLWgNAl7x3qxaI63AvtKtTXo7IrVmvRfWoBVVqwBGNaHsVRgO+pwVvGG2OMhJPsn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx1e8HAF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLTtg025396
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3HNTZG61tyGQ354XRaFA4/AZERq12Hf2Z0ImUJ6OR0=; b=hx1e8HAFCx6uBYMg
	m7yR/nOd6c5lUCIGDTJ0wQwmY4zNQIH+jhhRsPuKHhke7Btk23+h2C4KZIARnDIT
	vjfxB27/rRtgNc2pX5Ty6od64uwMfT6YYKCJDQhwo5GDdbRlCCRjX23knDnq2bG5
	9tu5/vcfOSsb7k7n3I2aI19dCdwgmIRXHwB54AA+wYmBKklY+hGO1VAeeYG9wR6N
	WMPzMDBTsSg8zTOn4JjWrKl9Ct86vrzXNe3qqHMQAWsJnx5DcOc69aVMnveA8uK1
	gcKAblYccMr/rXB82ylAO2rj74A5VSLl4v5Y1EOmnU1dmhj35/NXBJmEq0WED4Zt
	KXTEyg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkjyea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:43:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befbbaso1877521a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 22:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760679833; x=1761284633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3HNTZG61tyGQ354XRaFA4/AZERq12Hf2Z0ImUJ6OR0=;
        b=wWLT0LAPFyWS+MNBeqcpRvw1x7ItfdzY4pr/CRWeG44Znqy29Mu3x4bly9SJLZcDUn
         N0P7coqyYwf1vs0p+wC9l5mgkvLCPLm5aoTMw+4hd2QWaRfdR2XIff17PWpJ5IGjGJN8
         /uUy3Rh8ny9ZOJobLsyKqX6fLHmMoJ7u8hodpshGYc+veR+xEcZy+4RCM5gmYvXQnKHJ
         7NXDM5bKfe9oX8mVVy942k2Chzp6e+iM3r90JseLnNZWWnAv5raCRIpmo4+++M3CpJIF
         8zdPfnhBJm0FEgA3+0Kpt8IdpLoBqoKYDQVPAWB/geqD2q8DmgKFsYBcC1pxIHfNPwr0
         /wgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWRfP4qdM3gxbLhTCWDY4rEOSn/npfU2tMcThNrIJEj66Scr0QsiTwJ/vqrZgf9nYFhXdd9JIg8sGlh4VK@vger.kernel.org
X-Gm-Message-State: AOJu0YxK6H8qDW9Yyi5DuA26AhubtBig7f48DBS2L5674IV0Ghu3wIYH
	sGR9aCfJvowAiRLkPnwORK5U4xSxMouwtTzE3qTECx4eG3nvOlshA1tDczoJ0pzR+hlzm5K7P+h
	bc8/yENlKxCACe8PBCxQNPa3bCbPfwuvQnMmQkmZ14+a2WG0NjnzlaEnb4iGHbLlYi21K
X-Gm-Gg: ASbGncs/BQJLh5/qAC6wgo8Q9tntmOecR0+bRDEsv2xO9EZaP3PYrWR8VMlaL/OfXfc
	5EsRHZsZ4tqjzPOBAh6a+sSJlm/AcJjUR/mZWGaYZGlgsZQ+unmiW8P6yOWY7/+MQYqSFwGGnWM
	C6hnUXX0+Qhfun4RHXMPAJYkSEC05LlTK9PEdoiNLPATU13I6+oeXq1TpEEESP16eIPCeTdfyIz
	edpR4D0vzJmgXXG7+cnKltsika/uCqGPYbrvMSCGRr6iFYyM6a9lTejjRgDbVX9T83E9RZxRN7w
	S3Bg4N7kru24wSdbMDOUupsRMZ01YSGPon4gjnPzH+IRF/kEU11ZvaQeuoeKQFS7r+qKRWApB51
	u0UXdMQ5iiKkdyBwmvDNaf0+JvOSnXP060BuBXWsQZA4pOZjpvOObTe+dFKujObr6ULLnmg==
X-Received: by 2002:a17:90b:3f10:b0:32d:17ce:49de with SMTP id 98e67ed59e1d1-33bcf85130bmr3076490a91.4.1760679833249;
        Thu, 16 Oct 2025 22:43:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkKGplr1e0FIgqAkn9VUk4CK1gCDjmZzv4MNeOLxFkbKA9yNA7SDpBEBqH4wd5+MQPSwf8Sw==
X-Received: by 2002:a17:90b:3f10:b0:32d:17ce:49de with SMTP id 98e67ed59e1d1-33bcf85130bmr3076461a91.4.1760679832877;
        Thu, 16 Oct 2025 22:43:52 -0700 (PDT)
Received: from [10.249.28.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd7b3da16sm1465311a91.18.2025.10.16.22.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 22:43:52 -0700 (PDT)
Message-ID: <49032ce7-a954-49d2-ad73-305e154aeca6@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 13:43:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] media: qcom: iris: Add support for scale and
 improve format alignment
To: Bryan O'Donoghue <bod@kernel.org>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
 <1pcfuFRPOvlbfcSRFpaPmuhVvjNGodlAA-7UuSbGcqo5JUEv5bhYSaVjnriJNG4fpngOAgeasXFZDGVWzX3ZOg==@protonmail.internalid>
 <20251015092708.3703-2-wangao.wang@oss.qualcomm.com>
 <a1edafeb-af41-4c96-8c39-a327528e0802@kernel.org>
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <a1edafeb-af41-4c96-8c39-a327528e0802@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S6pHcb4hQC-pshpiAfeRRG233-HsKvyp
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f1d79a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yaWMp7WbkpMwZxctSSYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: S6pHcb4hQC-pshpiAfeRRG233-HsKvyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+cFzFtgOEOjq
 m/O+iITtrSUohAtnlduCEbasrwut1kLdU/Cy6iB6msIfGF/g2/8Wt1PmbiEkK7/GCtXXENabSG8
 gst/lVpoo69x1/MESriC3fYckiGksuxj67wh2yye+/N1ERZFTeJ/kZ+0A00bHu0FypBxC55Bo/F
 Eq5j7L2XWLGyCvILZB+8ItMoUTMjaqGZjvG2n8HdimA8oA3YdhirLgN05Ve94t0nvYRwrNTSUZ8
 pjKFgjwQhawDgSDcXApFF6/to0/GaVQJJ0gdSgGOo2u79idAcTts8ASMxnFIC5cQfQqtZ8VJCtg
 4cyUX6Mehep9t6i/sGhZqti3rPdSErDkhcz67FNVdNKOP7X0fmqOp97XJK+Xz7gvmmrJfs+71aV
 o+ACtnOGQbfBdMnmMOVXISOx57bUPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/16/2025 12:00 AM, Bryan O'Donoghue wrote:
> 
> Generally a patch that contains and "and" could be split into two patches.
> 
> Please do that here.
> 
> - One patch for your alignment changes
> - One patch to support scaling
> 
> in whatever order is more logical.

Sure, will update in v2.
-- 
Best Regards,
Wangao


