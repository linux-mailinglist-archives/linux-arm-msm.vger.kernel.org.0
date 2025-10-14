Return-Path: <linux-arm-msm+bounces-77141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D8BD89C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DDAC42100D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063052EBBB8;
	Tue, 14 Oct 2025 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gcBtrU98"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA7B2E7180
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435933; cv=none; b=VsfamnMs7aWVO3E63MvkwgLfNB8mQUL5Qr2L2o69vDE47hn7flS2tpxqjPIW64onWSCYyjk1cr6mAh9rqOx42diekGTf5RisE4W6gsUDGw/kOFJEwwwkK1R8Z+vdvLx8VfU1pTDMuSRuesG2UiWGXg2NHfKfce6tPR9y85F/LhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435933; c=relaxed/simple;
	bh=io6QOTrYaDE9s028FeLKTAMlnHfbHghqFVrGpVGtXBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVHwnl00yUEggP+ufdTlRsbD7M3dMHAnVHZCIyDJcpb34kEycnk+blk9MCvPl0OKrKekUi4lb9vqjL3jSESqzgn2TAy3DBGfe0E6MN1/EJp/DH+u9lqWlgWyp8QOD54S0iuUPey5LU1wqRFPFZZAytWbnfj/gmevDbZwLeReWpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcBtrU98; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87K2K017944
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DSMjHDTClxj+PalxEbTH9ZRHAQzCK5GT1sDSL01c+XQ=; b=gcBtrU98KIZEpLYh
	ajS7NMK8LRgG2D3spy3qGrrfnkkdBYIZaAY7ZXf/4p9xO+iwPdYfho5g9lGnf+0m
	2PNHN9hKwSOo5WbbPBEqNNiTmhrjNmMrrsUNogN8xwe8jkrf031Dde1xt9xcE25V
	k5thqj+03KxurUwL+ALqPlQTD4tvmNs+PLvWilI14lcRE1bPR3Sx6QfBQ+Q7Tp2v
	bJauW+nyoYomBwYxqq9XNWlXA6PqSAdhy5b+QC6ochfNjmtB3CW4qSAhLLT9CdtE
	33v//0+v9u4MVjS+CHR7RQdaL0QL1bRQD9RiNV0VlBcSDu81z0ZGFPwyvMj14McY
	VTUsCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1acbae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:58:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-886eaf88e01so257492785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760435930; x=1761040730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DSMjHDTClxj+PalxEbTH9ZRHAQzCK5GT1sDSL01c+XQ=;
        b=Y0pLzXIBT5yFgD/Y3eeRac8+6Jx1zpZLKpyCNz1qmvgyppjBNoS7eaDzHJo7ZtHUf8
         cV1U9mC9cHsWXu5BQK6UYDM+ff6x9L2GE1lfrVKAAtIqEy8xePidQuy/vd2ApBFJbmnV
         AaIn3ntL42DgA+Qnzs0AjfbNqyuVKLAdMrAZvhrieiDi8yQMX9E1qbnXk4SqVOTZxgzj
         i1BWN4XkD16wxFuz+7QfCgTHzUEE2nzCqJbKjzfKfIYZApIvBjwytB3u7XPBxOjxqw/s
         I0VSZqDsois3jEC7YfITFCTOryA6H3xs0V433+oIkoIapO7Dh1YQh+EgiH+gH6FQWYPO
         zReA==
X-Gm-Message-State: AOJu0YwJKwZAbscUb1lFkbEfRy7HbISswMy3bo+EbAhoMwYEx69kDklq
	FONqjrqJ0dAWhaMAlY03ap/uF1R8aNo3e7pg8EWAUW5sH9cSTTColrKJjg7YMx6KDcJO8o36yVq
	ORf2acjGrlZL6qZwDAyT9Mc/RoarIbCV9v0VT/V6XC53lKBQLoQ1xZk++v7acv1NSsiNuMMhSbe
	/0
X-Gm-Gg: ASbGnctpLzeqigy+LpOQXIzfskN7XxbNETKPE56tgfsMkVzHPnb0QT198/PIHcI9w/I
	371unNlST8mw3sqL12oiLGVswzBKP655RXMv9uqTLz99EDM2Iu+saeuHxnjMwL2Pr5WrCvm11w6
	xmQhfsTLe2ne7BH7VqXsKmi1nZHYPYan+f7uCdGxt2nZnH+kXQyYqzclPo5HL9YMjBeGSIq6z2R
	xyo0ZJVWQWzOJ4Egahzrrq4Xa9Z+HeDS/EKI9qwS4xBWKqBSqY+A/9baLFpI+jGtWraJFvJylv5
	xTYuxEffyOU/gAHT7b3hKNLRDeiNr6TUpekc2sJ+LcUbJ41BU06Y/Gk9noD7MMXvsi0m1xAR+9I
	+D/xLRCmhM7yBUqUJajO1bg==
X-Received: by 2002:a05:620a:17a7:b0:812:81c6:266c with SMTP id af79cd13be357-8835420965cmr1951153385a.9.1760435930129;
        Tue, 14 Oct 2025 02:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7NHtM1Gsh82E8FOY9EtkI41PKGeex0f4/Fw4cwVtCr7GMZQ8YGlpxMTjOqOvo/5wbIBEfeA==
X-Received: by 2002:a05:620a:17a7:b0:812:81c6:266c with SMTP id af79cd13be357-8835420965cmr1951152485a.9.1760435929662;
        Tue, 14 Oct 2025 02:58:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c133feasm11078988a12.35.2025.10.14.02.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:58:49 -0700 (PDT)
Message-ID: <91113d48-a8ef-4a24-a73f-6d32ac271a00@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:58:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: r0q: enable more peripherals
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251014044135.177210-1-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014044135.177210-1-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee1edb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=Ar6MW_cJkJo_tvb_ExEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: D5Ao8UEoQHszq5KwkxqM33ScAFsiAvjt
X-Proofpoint-ORIG-GUID: D5Ao8UEoQHszq5KwkxqM33ScAFsiAvjt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX4etx6tmpS3TQ
 MWYCJCUlTj6xlFet8chfju+ckaszn4+Db2Tt2AUxF95VUhc23/o2e5zXoIx9mKWqvRUwP5dQq7g
 Gq8y02U+SLL9FJ1X5XVZJa4AAO5SquCh6tx92l3XJjuCfi9we4fxyBWX3dqaGo0MBJcKvLWOSko
 dlgSjeLES9FUWJVH9h4zQjE2lej3sh0W+6rliQltzlB6/RvMmdmhdisICCAZSifJlAcNfySQMzh
 KbCPU+Z8fG7g/mssLvjmi1QnlUbVlDDHzY/F/kYBEZq82RcEiTTrEtsDpRi2Qzc9UENdXtdCM9B
 Oq/YuF4HeUhI+zvCyJJTov5rjALOppxiJvwcNIBmLXDG1LIcUq8GTK/s77qwbDWnqnQKQMZadwP
 MctyK3JxpNA2yvzEklNtiVouHSlCxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On 10/14/25 6:41 AM, Eric Gonçalves wrote:
> This patchset adds support for multiple devices found on the Galaxy S22,
> side buttons, touchscreen, max77705 charger/fuelgauge, RTC and UFS. It
> depends on "Input: add support for the STM FTS2BA61Y touchscreen" for
> TS to be enabled - and for the fuelgauge/charger to work,
> "mfd: max77705: support revision 0x2" is needed too.
> 
> Thanks!
> 
> Changes in v2:
> - split the gpio keys patch into 2 for small refactor
> - rename spi-gpio: spi-gpio@0 to spi8
> - use tabs instead of spaces on max77705 nodes
> - added new patch that fixes adsp_mem and video_mem memory regions
> I couldn't find the clock-frequency for i2c5 bus :(

You can boot downstram and run debugcc to dump the current state
(incl. rates) of all clocks

https://github.com/linux-msm/debugcc

Or /sys/kernel/debug/clk/gcc_name_of_the_clock/clk_rate

may also give you a good result, although YMMV

Konrad

