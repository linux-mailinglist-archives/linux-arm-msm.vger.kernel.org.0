Return-Path: <linux-arm-msm+bounces-67506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CC0B18E47
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 13:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EB3F7AABDB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 11:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF3221D59C;
	Sat,  2 Aug 2025 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKFBkcc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD98836
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Aug 2025 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754135504; cv=none; b=n3NO9sFKNDUOYhZuovCfOxaDFrXpV7TPXs8gSi9N6Da5+vZr7X0gnN9a/1uFD7cY8qplZiqmD4tz96sNGxoQXd/ainmSxe8+FG9DMUrGEv+NAJv7cHpTKKUmzJbqJi1zMG783+2baGnxLubmBEJT5UefNxzToKmsP2o+kWMig7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754135504; c=relaxed/simple;
	bh=cwhskkQHxnYfasrHsNVYlAECqj8888w8AC/yKReeBW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLlOnwAiDbzZiMFbCBrHlBRRE0Yg292In1okho3exx9nJ3ATf3QTkCze++yN8mhU9TZuuCRNcGXSOfucjUtYdiJI8N+3Y/ISisuxtt7k7W6GyZWWAIZHjoROCoapGC2o/N0qxJxhI2I3uTab3WzWPw3MJjSWKoOqT0tvhMp7W3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKFBkcc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725fDJm031151
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 Aug 2025 11:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/DgWLRfkizWpDIwN9xYrYao1ZV5rqIRUjhPnkkjtD8=; b=XKFBkcc+7jQ/E6Cf
	PIypdhOan/QhGTHb8GTAy5/TV+2UsyLF0LKsxBclG4Y0vezL/JXfdjAI75ScndCy
	QpXn09IoP82szScQxWHr2bseQF2G36ckPjc6cg+rr4LUpEkwgnLraW9XOhlYRi5A
	yXxUbW4vxV1jBEwhHwzABvV8+UThuC4LYmTCGQEXDpJ+BiUXYdqX8M3Yml5Y2mzi
	dZNlsiRpAsW5DOYpQTegBYxfx2o0xdnni5YoWYNwXF9HnFdWQloAmaH+OaAOIjip
	5xoip73c5/7zeLSSbW7DDHC2GlSaXfXxW/N26jUNdEAHwHcQ/2kwaNEiEv4Fuef4
	IXOVVw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489arwgrg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 11:51:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4abdc49ce0dso2893121cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 04:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754135495; x=1754740295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/DgWLRfkizWpDIwN9xYrYao1ZV5rqIRUjhPnkkjtD8=;
        b=X+3epMpWSslZ0jXaTFEif7Qb4b8C/evAmYoFVPUPjE7iX6VzjLHllbGIMo2syinoqb
         VAsu4T5RGn3RSzuRM1LIStqi+ViMbHgLmqFCmUwjvOe0PJa6zVvY7hlH533y2MDY4/gr
         FaV3uAK5DZ9FouTVHd2qcp3IC/BLkWs2pLQG6r1nsJi0oIMka5BOzT2jtmrELCcJma2N
         vrHtge+CEy4v4asS47jf501kijGmMMLl5YVdRI25deR4y0igtlpvPuOPTuSMHIkZ46hh
         g7mKVeH9M/A2CTrQyKOOWkgiTDGTCbs/WR0OJ3LSFt+jWF5US8J6Z1G3qQtgcD5QhOqU
         T+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo5+JuN+4BGRPvZ92IcnFT/iqrEauxtVDs9F6bSXkd9Ud5rD9qbjM55j3FTuwvWibNXjdwT6lDSVbIRMnb@vger.kernel.org
X-Gm-Message-State: AOJu0YxRgOLPjyGPobIP1R5IGh5F2y0zYIfh5b6UfZGlBypP5vFh/Hqe
	Zk2Qe7jIUF6t2ZBs/AZlfg4S0PSY7+Aop8tb9otGeLWr1zIoMU/Dkm0HlilS25qtjosxB8D30U4
	z9F752g6bYb/OwX6rAWdxq/Fz2OkupN5t0Zpq3ujslgZqMKMC96bunxkaAWnfxvvLxRh7kXpS3a
	n2
X-Gm-Gg: ASbGncvwjLMAfRHBT0HrPdLkHrtN+HZpNu2R3aTn5+XOE7/Hsis5bQcMVCQUTUaF2r+
	EBnC0z9zYBLIdc6+KkBlxXpI4me50OXIVMGLfO/F5VnBU8wWKIdSdCYZc3LdpgWuRy+eiAPzxAp
	rQVsdttpw0S+PA8f1LumUjZjyAqkOp0wIa+oduDUM2hH66CrzLR/mUkN9qdgpug5GoKBr3RbrYu
	8ZvGzVsViU172COvDi96aj/OePldIw+qKI4wLuhP39JNfdaBaR8EDFAtjmY1WkdiOKePbaxozuX
	rynF9iPuXhtbVlfPW69J3IoU0zKTUoLBRA3jjqlfUiZ7iLu6M8rFG8js4vSUOBIcW2t2GNIzSh1
	a/MQVJH11ra3QN3UMeA==
X-Received: by 2002:ac8:5f90:0:b0:4ae:b029:cd7a with SMTP id d75a77b69052e-4af109f5ea3mr23289471cf.9.1754135494901;
        Sat, 02 Aug 2025 04:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPWM9sLqt8vURwy10lu/N/ljO6lv3hVYnNY8J6u+FstnqG5aDn0WOBvHDz3ECFb65w3OLaGg==
X-Received: by 2002:ac8:5f90:0:b0:4ae:b029:cd7a with SMTP id d75a77b69052e-4af109f5ea3mr23289301cf.9.1754135494236;
        Sat, 02 Aug 2025 04:51:34 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f17829sm4023348a12.19.2025.08.02.04.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Aug 2025 04:51:33 -0700 (PDT)
Message-ID: <61b1ac3d-8481-4731-b24d-2864e24625b4@oss.qualcomm.com>
Date: Sat, 2 Aug 2025 13:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: rework nss_port5 clock to
 multiple conf
To: =?UTF-8?B?TWFya28gTcOka2Vsw6Q=?= <marko.makela@iki.fi>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
        Robert Marko <robimarko@gmail.com>
References: <20250802095546.295448-1-marko.makela@iki.fi>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250802095546.295448-1-marko.makela@iki.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA5OSBTYWx0ZWRfX3Yml9/IWTMjt
 fVmyIwisZrEd99m6aEfFs+o/qJ0fBhWmxf5Sj/bw+bcIICw3eqiONWmX3gHm934PLPcVzTyRCpW
 aHTeh2Zm3IrD7e2Gg8KBVdKs+Dou7eogsjxyE0sQumX0DScerTOSJl0rtwK2XrXqwrMtOcBEzJY
 iFQwZOeGY6W9hJVT1PPmAC55KwO4LEcjS1L3hkii5CFsKYbanpmuxsJQingQbXVbq00hj8SvAtE
 XAFCnV0NdF2CBRTeQ/p6ERL/8487U/Spmxc1laWM2O90ddhpTROZE9XYK9wVi2edlfGTVz+Avqp
 5zJMTqWA8MuXtxmvZshJku5/TnWXRoS8+mhp+FEs8MPAekPAGF9vXXZ2APuaQVVJuiWmWxNjyo9
 6Ye6a79YW6EB5eXqt2ET9WfzoneZ2HCGORczrJw4FseqfRWSIWCerhtKq1M8/R2p0N+VykYe
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=688dfbc7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=CC_5F8MxV7t5y8d6RqYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Bf4htik6paZTTaWYqnk-XqdITd1s8HsT
X-Proofpoint-ORIG-GUID: Bf4htik6paZTTaWYqnk-XqdITd1s8HsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020099

On 8/2/25 11:55 AM, Marko Mäkelä wrote:
> Rework nss_port5 to use the new multiple configuration implementation
> and correctly fix the clocks for this port under some corner case.
> 
> In OpenWrt, this patch avoids intermittent dmesg errors of the form
> nss_port5_rx_clk_src: rcg didn't update its configuration.
> 
> This is a mechanical, straightforward port of
> commit e88f03230dc07aa3293b6aeb078bd27370bb2594
> ("clk: qcom: gcc-ipq8074: rework nss_port5/6 clock to multiple conf")
> to gcc-ipq6018, with two conflicts resolved: different frequency of the
> P_XO clock source, and only 5 Ethernet ports.
> 
> This was originally developed by JiaY-shi <shi05275@163.com>.

Hmm.. I'm not sure what to think about this, given that person seems
not to be using their full name (or maybe it is the full name, I don't
know) and hasn't provided a sign-off, but on the other hand this isn't
a very inventive change, so I don't *really* mind - up to you, Bjorn

FWIW for the patch contents:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> 
> Link: https://lore.kernel.org/all/20231220221724.3822-4-ansuelsmth@gmail.com/
> Signed-off-by: Marko Mäkelä <marko.makela@iki.fi>
> Tested-by: Marko Mäkelä <marko.makela@iki.fi>

We generally assume you test your patches before sending ;)

Konrad

