Return-Path: <linux-arm-msm+bounces-75663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D09BAFD73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C7644E2477
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F74221FF35;
	Wed,  1 Oct 2025 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9tK689E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2A626CE37
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759310524; cv=none; b=qsba+XpptC8DS3H3i+TkMf45R/5ElkbZjstr+WfK49/sm/Abg6qwepF6QDDKgYzfhtiJjY3qrvOQYP8QAoEktyAUo/d6/G31nvBX/0K6pU9bfu0N5/mvq3Sjp0JTlj+duhPoLvWP8YDs9FqxUVbJgpgY7te8ScPhfvGupjLejPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759310524; c=relaxed/simple;
	bh=IdRnIcS6QKGTsIaT5QjTI0wJOvHQNm5+p8Y5bF8BEoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JVrLZNcGEenHjxcYTDytWQA3nc9TtwIjufmRc96gxXzKKN2Vk2YLd7PIA+XZaotYAUOIwW6YpEK/tLZy0BrnQCRX1KpPdUwiZS0THEhm283eP6UI+40tL1evU3Q7SVv1L5jYGGZlIo2ZDdUytTV3KH1aE3wktXcMhV/B06rHenk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9tK689E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5918UdCL012446
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz0VTKMOPpfUrE/UuDLPx/DiTF0z+t2Cca+4t9M7as0=; b=X9tK689E1sWeCYU7
	Oa48+v8p49Tl/xCE/8gLhfDuvtfkhHGw5/7fqIUOQmpMIu12hLGHd6z/A6UQcppP
	KrVztvZW2MjG59ZuIaNM6P2rHAbv9QJCad5UadMheGQaBzOyTu/fwuEXScSSbPxV
	HX4C50+9eP3b2gaSkdOc2xv5OmS3fa0P5bYFZom51c6DqA62XTricJlP7kJTpqfi
	FpLtzQJGwueoEI8PzjfpWliFjeim73bXQfIGqMG64Byt+nIpcOVo7UrxZmcmj8Ah
	/mdl0UaYM/djE/0SL95megroMtjIOhsyWPg2igRBtoHvhCuixSVtvm724Huph9Sz
	AriOiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a641tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:22:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-85db8cb38ccso185174685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759310521; x=1759915321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hz0VTKMOPpfUrE/UuDLPx/DiTF0z+t2Cca+4t9M7as0=;
        b=eTtzYBhWJXugcELxINliWm8I6FHaAoMi6SYZrimKBM0LZHi8BzhpqwxetjIjmXZffJ
         EjijzoU2acctvT1YjAhsBhfrXY3Z/dKEbDHVewZlM5FRWW2GMCL2aKeBC9CDB8AINLgu
         mZRL29/qy0TMQh72aJpwAnlGmtR/RwLhAx88QuyPnvdMkEPjI809Nsk2q9TtSmoz4Df9
         drYI0ubP6ktd2OvvaT2ZpXgDYKTJd3PjDd0r3/maf5InNP8S1pB4hFxUycR83rcyYh/Y
         6gPREs/9ad+sbGXe0BzJ43eI2+2FwDf/96X9BYl6sEh6unJST0fsiAAzIYM9CkRca0Dz
         67XQ==
X-Gm-Message-State: AOJu0YzXN8+nXBu4fCwr9f7rQpYvLI2yAP5/ICaFcIfg39IF2c7MU1/2
	/6ac9CoUxA5p2uY+XKSOIYU/sr8ia5Ht+azMvvLk1xZe8cbS+5plNCqYuN6/5kPgiSpNIUKmcMg
	vf8T5mZPNexXROoXUbX4UAgEW5VGO6WvpRX9V8ZG2VaGRngUPBtFRAI/LbgOXAOxpWiBC
X-Gm-Gg: ASbGncse0W/hLe92wJB7uf742M1KI7RqDYQyvhhTDmgI9cPY89I5XrejZUvQmku3TVg
	R9iqSSBC2aGszpAyrlb7wYg22fPXhchBk1TEKLHrwQMyWulSs52ZLCrl3oIVHxMu21aVglygtwq
	mUAuJJSJ8Na8EJyYCL6J9jI33EnK08AZ+uI4i7mO2sENHRxxfHFB6QMxBa7dWdAu5zCB4M7hiGp
	ddY96qKiFtNdl0ZCcsgrZSOYQ+t9MHNq7g9yo/I351do2+8q/onpH7rQwNl9mO6O8V2Zm8ghKMQ
	qtGX6vyUrdS3GOb1H8la1Yvz3UwCQ9WtSW1waqr/fTX9UqZu2xjndvTCArWSueToVSX2lU/UQRK
	uYIBhaqZazh7q5EQV6qasR/w8ELM=
X-Received: by 2002:ac8:5d11:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e41e91e3cbmr21974681cf.11.1759310520588;
        Wed, 01 Oct 2025 02:22:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4I5AplJOR96MzKDzS82JAqomgQQ5+85uACxZXIqYc74cYo+UMLycwKcE3vq/qFToNbOcKEw==
X-Received: by 2002:ac8:5d11:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e41e91e3cbmr21974551cf.11.1759310520172;
        Wed, 01 Oct 2025 02:22:00 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3f575aa299sm573251966b.50.2025.10.01.02.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:21:59 -0700 (PDT)
Message-ID: <c8803f7b-74ee-4722-93fa-24538d5bfdc2@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:21:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: glymur: Fix the sec and tert phy pipe clock
 halt check
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250928-clk-qcom-glymur-gcc-fix-sec-tert-pipe-clk-v1-1-55e323cc98cf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-clk-qcom-glymur-gcc-fix-sec-tert-pipe-clk-v1-1-55e323cc98cf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dcf2b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=6KCzCHlq8YoJfQJeh5QA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 21-0KZeBvdQmmy2MzbKLJvK5rmUXV-5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXySryumDsUAYh
 58dfONjmVd1IPC+pZYA5KashNlbLMSH/z6W6b5kzzTwcTlRKDGzBjgxP59jtY+Kw6+xlBWm1ZJt
 OYvV5dhaOuEHFdS/VyYWRd6q05c8YLK267rhsg+VjRUsYyTIz/kWPgASFGt1ZcT1GA/vbWjUqtf
 32wBuvFqNxf6yDtWRQmNciFdzooIssrlFMBDdkjjIFPXmWriFM84KtLQmPOP4lrOTmxAXX1ZPuZ
 otwZDowxxOyQqsS9f2x7Rq21CgottxJfz04l3sIyRPf6xUfXOmkap1oatdWRrOOcRzbgvpjkexP
 tOvTZqZ9HEPAf+Db+crtWac63Uq1MF6+KS3LQeoHX6VeQnr9oQ81/aKpO3sVdVyPllgR1usX3eC
 3qi2xBD5w+3HbRfq0URA3IuabY8f1A==
X-Proofpoint-ORIG-GUID: 21-0KZeBvdQmmy2MzbKLJvK5rmUXV-5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On 9/28/25 3:14 PM, Abel Vesa wrote:
> On Glymur platform, halt checking on gcc_usb3_sec_phy_pipe_clk and
> gcc_usb3_tert_phy_pipe_clk on enable reports them as being stuck as off,
> but since the gcc_usb3_prim_phy_pipe_clk clock halt check flag is marked
> as delay, means it probably it should be the same for sec and tert as
> well. So replace the voted flag with the delay one for these two clocks.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Taniya updates all three to _SKIP in:

https://lore.kernel.org/linux-arm-msm/20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com/

among other fixes

Konrad

