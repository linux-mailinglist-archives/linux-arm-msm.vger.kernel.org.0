Return-Path: <linux-arm-msm+bounces-97472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NHcMCcEtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:33:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC02830F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1757F322F7A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E443391846;
	Fri, 13 Mar 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1XtZslm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nr96KGzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58657390C8D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405147; cv=none; b=QmyXO7hKOiuPT5DNa4cjs7DZ8JlJLv0/IjV1tMPMvbYLa0YQRQ9wTw5mCeosxHtSLRsQ4dxqSbu/kFSJ2lnD/ZIQ8n2LGV9PLoZw8R/XVx+ZbJa8VHB7TEX52Iy3hRnLmrfv8OUXxJN1wH0zMs4APV3PaYKC9My5zmWQbQ9z2SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405147; c=relaxed/simple;
	bh=x7rkLsw7wbu+qytHYBTIBi0HZpmc/gqx9R4sWCZxqQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3hCC2jLpxJTRRTp63exntYT0MWFkjHT5aYvnqV5jxrbZt7/7rDacVlpiWXJb4Vsv04ioftCI4+k1I1KY5uRpnIxEz5LlXCLuRteavvcv73wh6iDzg3ECUv8EjZkZvttYsOVby81LW+DaHa7iF0xDxk2fgKqCrzQyjE8KGNzKfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1XtZslm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nr96KGzr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iL8v2262548
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QZYJ01LrNQF3ZGa1dcteaF1PAIuvuT+EltfI5b8h+uk=; b=n1XtZslmkV9Hog/Z
	YQaxoRH+z39YlkyDHcb2PVrXiJ5RkTlbXIvw70iMzAPYOSKzXTaiAw+FZxjVZF/I
	RVbFXSMenBtlilwzHMKqYylSbc4Sme3wBB8LajycWoaJCXORe+FI4c/xJN/JJN1Z
	NWvz/cNqjuEdJpO59qHgy4+bfgAUvV6W6tFA1R/0oKrUklUBqIXSVIjyP3wg+6Uv
	YNIBZhex+sACSRnmKgvwi6OKM3h8tUEYZUllDCEkiqLNvVW4zPfGWScX4EGyGd4I
	WmTA0vnm2B6z82yoS0cbCK5KDtUqdmFc7RrDBnNz1x4tzNE/zPdjWClph4XuBA18
	kmDNkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4ryju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:32:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb485c686cso104388285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405145; x=1774009945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZYJ01LrNQF3ZGa1dcteaF1PAIuvuT+EltfI5b8h+uk=;
        b=Nr96KGzr24ud4tkQkffs8IbL8AllWeQe+od6aichVy0sd8+UB9iU7WX8rNGUTUBWPS
         QGMbRyrNY5dayMT2o6Sg242pWJOEuwMJxXo0hc1mxWRBTKJ7kDMZ+V3tLbsgsNiwvWZz
         XURRlxobVkgyzIST517Vh/3sSwjK6AqEzC6T01kjIhm5EAVFTqMc/KLODyJyto2Mz4UX
         V6rke9HQNMX/b+ozIFY6ykN75PC2qvfH3hdTecMyXIyPpdTBD87GjvouPPRWhRwLObvJ
         Wzh6tdcUdOEfy+oPamVis+QWgLph2AQajwgUImbTrfJIFz5lR5UznrrZHNIxh9vnf89e
         yufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405145; x=1774009945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZYJ01LrNQF3ZGa1dcteaF1PAIuvuT+EltfI5b8h+uk=;
        b=fva92KkquN0XslIt8/Uj6pla2j3h7XIu245qMMm0vMYQHhyP+u6Dyepyp5u1zOwQDt
         UfXShvWG1GZodNsL+l2l0gRjrjJGHDZM3ypjN4EPo2SFOracQrf+26ogrBIf0Z3BnDLf
         tagMiOI/xxWvNAuAkl9E1iyA9dN1GiHy5AK7d5dDCrYxmlsLR945FJYtHOayJIaHCCUe
         xwtNPwX70bnnL8QdC5i/oS35t3fFZoho7j/JXzZjTgvSrb8ow4xKJJwS9xmvGrmcHt2O
         Qg40eYAZk8KndDe7Lm1Tw0gS0ZOjJOJYFV/iaPYLkVzITRsTrvJaSdEgGxFmB4WUP0Y6
         c2Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUD/FVhrOrHlUWHrKvttvSRTZppBQhqMNV6FYaeQIVuFiDPmtJO+FnhZkcxC2cIs/otFf29pyN30MFgpYVG@vger.kernel.org
X-Gm-Message-State: AOJu0YwdBoM68U2/btIXA3iWau8a0TAhu4oouFoAunjp+6C1ifpHMSJm
	x5iUcahyyZ9yEPjsq62sT0mUKZFwxHYdUtfHz9uLGwHME/k87b6GY6WL/zOWGn97lJvvolyQV4b
	uBb8FSfWhhkcYeounYBmganmF+pli8Dufdk/pAmT7c3GtpKV3LoTQ68g3UgFc7XpN4Z1w
X-Gm-Gg: ATEYQzyLv6wqIKMCQ1FPqCy/1KAET9EdjJiuNxyL4aWXjpvduNT0cqdsU0EV+DvGLjB
	zhiJOGtAFTOtuXUZvvHQ7patOAtMTugMtjW/B5KKA7MIcnPNkPhA1xKeagQ7YC1IjqQh8SVw31L
	t5pJ2fXVKIHx0Jp8s27hDM8upYFD3yXMkgXLOSlDH5ijkyXl3oEDwlHr2rO50HaUTJ6UYCA5ILW
	P1Jl7CC6c/SCqjIWPrC1eB4auJCO3GMwa4gM+VskkTZWgm2TEQTJA4Lx6tNSuhWJ7Bo3sp2a23U
	vRiFIYZ8Ge2YMPwsnHuqmcKxQLnKzI1WjEFkECxuhNd7BXFuc87DhVLRDk+1rlN4++t4rh3y3J5
	rOLFeGtdJJ34DOwJmf35jL+ixvQI2TgXpdo05PrSNIQrf9ksVEWsjpjYVpzWppj5nEqzZPAWPYn
	bwbZU=
X-Received: by 2002:a05:620a:1721:b0:8cd:86a2:340c with SMTP id af79cd13be357-8cdb5a33328mr339359785a.1.1773405144730;
        Fri, 13 Mar 2026 05:32:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1721:b0:8cd:86a2:340c with SMTP id af79cd13be357-8cdb5a33328mr339353885a.1.1773405144165;
        Fri, 13 Mar 2026 05:32:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-663509919c9sm1278202a12.23.2026.03.13.05.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:32:23 -0700 (PDT)
Message-ID: <e44bd3ac-7689-4014-8b4e-cbab952475a3@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:32:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: sm8350: add Iris device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260312-iris-sc8280xp-v4-5-a047ef1e3c7d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-5-a047ef1e3c7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JQWvncoNWyASwP2NsjsM_MZ5s5hEfQNd
X-Proofpoint-GUID: JQWvncoNWyASwP2NsjsM_MZ5s5hEfQNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OSBTYWx0ZWRfXymIc/GBc1P6g
 culTWxiZ5rMSbZT7I01ie0JkPpY4KY7/6+fpMSRZncE2TU85FqWl4Q8cSfXUBLOGqf5HK2g+3cT
 pyJxBw2bMU3msiZ4w9MWHLseTIT2v3ya8by+d9kj/qb7LzhUGhkzRmQFSowDfSRnSUwmdqdBCL1
 f9DbLaa+6K7k2qSgLVxhNPuKen9+YcNuERsJrdPLNAxv/nevlVM1ETHH8Pz/uiX2ULRRa4iW423
 eQrMzWzXubfzNr7C8bucam3FtqqOqE99eYEJBZwZZQNB04o42PvnatS5r0hQiHSXoU2Fda5oWWT
 lLJ2FVkPI+Wq9Y1uf0vTFj87b0Ur1PSchIc6B+SAjeQ7AWoaZtjgbn1PqdBwqEKKfB4TTg+IaIV
 IXJn+tzp0xs3ZTdPMyubFDWMquXNcydDwQU8v2vOXE7IhaUDt8qx2+t3FpoLXBjrZNwArtGpGmU
 lSQn4df9uqfgt3Ul7Cg==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b403d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eieJN1dW_h90WNUnBKYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97472-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29AC02830F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 4:14 PM, Dmitry Baryshkov wrote:
> Add Iris and video clock controller devices, describing the Iris2 core
> present on this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

