Return-Path: <linux-arm-msm+bounces-62869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E99AEBFC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 21:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2E154A7DEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2E521129A;
	Fri, 27 Jun 2025 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAvw9ewj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A793C20A5DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 19:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052414; cv=none; b=DUvKr0XMZtXRR/9gGosn4vpc7PflBjSdYEqkC0vmaoktM6Y57h4vGTaZN4S2cPZrOf/0+HDqoXGGSLBH/XxePfRKigj+r2ZfWLRd1VIiQLHscwTJx0mgJ2NmRgYUp9KCkLUFJiPePbOkc5aurCWdI+f70KLjkfPEbyRgaAi/6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052414; c=relaxed/simple;
	bh=PgKJBp53dR2Ai67YO4V4HA071loDKNdxLue3b8RIr58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apevyIwB4jxCz7I0L1/OgcQA84ZSFieWyTbwF+O9LNqWZczqhGyhVTnhHeUdXgusvrZDiX34zoqONyDJdhl8ZLxAQGugKpN3PIGOwpcOWyqyaLq9pd1fgmJKYPwDwR1CkTseAhaijhHN5ZTp6brBMkBr8l2fAUP8lrevxEQVyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAvw9ewj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCIoSC028698
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 19:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C34ONTM+joY3ACRb//NUdUTbM2c8N4wd1fosaRZcrkY=; b=fAvw9ewj+WXk6hsR
	H7EEKDhYakCtAsWIFBtBE704V+9MVIFwgkjPJ8+ByILnTPMBhoHyLjXHyaSwHHY+
	IHkBisTMnVksCJqHulekIir75GZ2VaWmMqFx1EfJ2Ko5YHW/k85gItEJnRMT/HPX
	Tn2S/HQdebfWS+YHYrbAu5AhqdraMR8jQLpfw1e5VvOpNveO6+rDXIwdWEtnJR5P
	vHUoOfLgbSNXQCBZwaDfnqVcxDryD4X4olYv2DRN9DEbzpK4n3H+IRZPFF3JB26V
	gisA2Amo4581exSBsuQnRAGtivDoI4MC14M95n8FMm1RaQ69rdCzFqmFYmw4pzR5
	AJqAtg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa51523-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 19:26:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d440beeb17so22224685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751052410; x=1751657210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C34ONTM+joY3ACRb//NUdUTbM2c8N4wd1fosaRZcrkY=;
        b=Kx1tHsa6uIvgRazT2O4cv+VVm4PYB8Vup+ELxVxbIMg8tMDg3lvPkABAINBKh08PjA
         mZj4SCpCmim6TpGmtdlSHetoEzEf1DRabY1YEus3qk7dRVoM6W4YpTZdrOBkEzgtwzIh
         MovqGN9PNWoCSIFV1OQrzuKWellSdvUErOYWBgaxxzsY0IESc5ME2LyiamHv92SHDqqE
         8v3kahqooBledHYlWOdfvP3ZufC0TORF9LXnHT3rD+ZuowfM8+ZI8WaEBsoBEjgecVOU
         4kEkNnFm1thNnIvePVPB7wgW7mXIqAODJuHB4gO4bNzJQocENC4xVByLDNYe6GSUbIdZ
         sfDA==
X-Forwarded-Encrypted: i=1; AJvYcCWmmYoynl2QFccNxcjd1hfc6EHkss3QbqtKtO4K9stirTjhfBEWBdS9PmPL4/7S/Mlxjv4oC+q6tfoBlS1V@vger.kernel.org
X-Gm-Message-State: AOJu0YxEeP+j48TaN2gi2y/sl9cE4k51k76mRWlbqPqItUYEdZODl7bW
	Gks4uC7YpkPHWl2Z7K4tQoqP4L7iwFsT9q58TisCKWRqKb1vKIof9fc+EsowBuRIkeGevM0xc1E
	RUpJEU16+ALsC9Ji7Zy7DAW9Z7WvrpktC/gzWn/qMSIdeyFgAf+NWUCyBjhBem+e5Hy8T
X-Gm-Gg: ASbGncvgu/oypQQyehcfsa0kheY+2nGPCB/fC6cTks3m4qf6676X+ItzfjNkmB+CB4n
	VSCNt5eGRkYHvOmOhQgc7Vmgz9skCOLKOx/H6qWDPBNJUvGvn6YKX86IBSpHxmLqIKw53Urv3Ux
	/lA51D8bkMjdeeaCACnGxtjwD8kbc+OPunSy/IxLovF0VinHU+QdM86QoKyyXJX5sdBJhcQd23w
	DqfZ17shZNrSRKhA6x4944H1DeVSlVnPajlVkVpZVxXkvHInCpNaNNLFOupcZziNgIhS0tBEpOR
	hJffWOpj5cdXmNwifD74h9uMsG/ZE/qT0durXnlfgEZSe4iEIshXz8V+LkboPkmLT9sL6C1WOnO
	oaOQ=
X-Received: by 2002:a05:620a:4384:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d44c21acefmr18328885a.5.1751052410529;
        Fri, 27 Jun 2025 12:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHDPYkLsnmO2nGzNZ10OMjymrNY7J2wqTDz4VWNzNFIV4cSvpU0BqsujQtneyalnxm/ShhOA==
X-Received: by 2002:a05:620a:4384:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d44c21acefmr18326485a.5.1751052410034;
        Fri, 27 Jun 2025 12:26:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bc2dsm181908766b.136.2025.06.27.12.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 12:26:49 -0700 (PDT)
Message-ID: <18dddd39-6118-4b46-ba07-8304d1830798@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 21:26:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: rpmh: Add support for RPMH clocks on
 SM7635
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
 <20250625-sm7635-clocks-misc-v1-2-45fea645d39b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-2-45fea645d39b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685ef07b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: q8TqRw-jSpaFbFPkol-BKivvnld7K3jM
X-Proofpoint-ORIG-GUID: q8TqRw-jSpaFbFPkol-BKivvnld7K3jM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE1NyBTYWx0ZWRfX5MKzxsUQ1cL4
 bPp7er/c+6VxI3rUPUErjlt10Dll2V9Mi+vFQzD3zFGVPwTeP8jitTdNcFMnJyWkFUChwRSKnaT
 VMdexCumsR+rKth+MKpaD6FtQ3eLEhut4kaOFIR8mXZ95tRSPLfh+pmPzZvMOmQV4Oggq0Mdun/
 ICyb71JnzBiTk1jV2XLPxPW9ZwFA1vYNT08i7Qnwh9KYI8UGIYGAzx89uf62qMn5ET0piFyN4Wk
 tJe2QMvFLzCDZiBdpts48qEokkdn89LbwkhShu6QC2vGwTLrbjvqQyk2CYb5Rl6pQElyN1bHh0I
 /hmcgFkJO86OXI5umpbMKpKW/UDszKFf4+TcmDOibT6cbtp5pg3nww8TjRwi09kNq/l0rvOxP03
 jPB1cRsd34/D+BtmtXxn75Qa0yTvUnlQqGlGuBMUJy5DDf2CbAUAybe9fwajzY1jwP7SWSXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=882
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270157

On 6/25/25 11:12 AM, Luca Weiss wrote:
> Add support for RPMH clocks on SM7635 SoCs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

