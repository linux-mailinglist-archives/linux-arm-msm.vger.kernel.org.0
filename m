Return-Path: <linux-arm-msm+bounces-59502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E941AC4C37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3BC97A7DE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 10:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F6C28E0F;
	Tue, 27 May 2025 10:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmj/ibiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5C2550D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341435; cv=none; b=u0liV8sPI/BE3XC3tFssUOfnX/UHTv/BlTwO+QJS5XSmLemyCglJCyEWV8qcLGFUF0Wbu9UTIfNGoHYEb2pNPmzCn4VOTXqJ9Uwqq/Oa6SGeY4v1jlf1dkcXkrimUG4kHA2EWenxFt4fvvoiTwI03wc9NZUHTJs7GP/qe5duCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341435; c=relaxed/simple;
	bh=d5oYTkyvM5Rfr5kvW2WiUShV3782Y2zCoHdD4qgRIfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5yjTwQ903DGUACml1scM1548WgTwxdelNPlgW5y0xG1pauQa/WsLSk8GflTNp+KJ7qXy1QKe6FQoEj7DnfNRBgkW0v2wvL0tciET04bO1+hD/5+kVzNdiXA3kjtu94kw+pORNGij90OfJcsy8vdSUb3Yc+WslJimWgXdIGPfYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmj/ibiF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RA9xH7031014
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s62TShu5x2yVlqUVBhpvVO8xAtnVMjqzkvJEdtCK5ak=; b=cmj/ibiFw5KtQZdD
	gY20Lv6I08SF/k1hfGHiwrgxzVoHLl18xqKsZiZxqYZI1J+LsW8B2vGFSCP5Pofy
	XccvktVt3znjzanBVh78MQlQt8WkE45RGV0vCgEr4coqdGljmJFOxzMbotC3ShtY
	yibo5Onhb7WC0z/HiRz1UVyFcPxoAs+w29DFnSB1ZQTgaFK7/ZFdpuKUqlmbeLZb
	QghGczkBzWCspFbFQJtU/tFvnxnTNcS1ZmP6zCE2SXeyz2EqFYFh421jhrLITKM1
	qXvd7oS5JBtVtOxenGkyAkYyQjMMhAEFF2dNJPVlD8WBq/s49+l2HeyE7cJpknOz
	y+B54g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8xfhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:23:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c76062c513so88860485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 03:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748341420; x=1748946220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s62TShu5x2yVlqUVBhpvVO8xAtnVMjqzkvJEdtCK5ak=;
        b=wr+luDCkUSr5ZnOUubOYw6kn0jxVl9xuvSiuSanguFLWQEbCINHGut3HBYZdtZrG75
         cRZH/rL2GOuBwsXvB9Y8YatY1J8f7t4sJEj4XUCtIjv9BazoL6JKDTXPjV2u2Be5fXg7
         KWTjayF21AHz3boAIHQ8dn3JbySd8O22xH1dGSYiUPRd9G+HwS+Ar2IZfAtuh0qHcNpN
         oxQRmUWIIlhmdyagPg6PBenkcrwcZpUx1yR2Oz1qg6l/OVucIB3wLtpoGnxf7GQHtbFe
         325iPngQED4SNpvvfOOmQ43wbNdkBhXWzouVvfjiRzdVFfHPHPTSvw4iGAHYjxjNx5Xn
         v9aw==
X-Forwarded-Encrypted: i=1; AJvYcCUIU5qni0pyteGXut5GQcmkOm2cbw6RSF25MiGNNJczxIKULOMV7BkknfY2Yf20VWp3zUAm4y5PEiMhup+h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaxk7VzZtLiYcpkVhZ2f6kIRT5Nd/a8LCyxqKqJHHKN4cNe206
	duhvo93MN7mL67xYPumlEcx+tpDFZfCOqhHU5Cj+q9+mmxxsfp8pap6NMpvvO39FxIqiEKhVLNr
	1tIJpGfnAZKkHExdrZbhtQpIpa+BQu7O9ynDfRSToSzR5FH8SuYZ/61AijjjZUXVIsetn
X-Gm-Gg: ASbGncttG6RiNfW1FmJ/vge0rBap9qNeqWYPnnP0oh5LhjhOP2hVF3uEE5KILMQnfPx
	tlL1R4tRdOyhqyvI06zcz7zO/xgwN2uh95f4I3kjxFNWQjOW8OdG8tRK7F/u2wYuc/d546s7y09
	z/A0qBSyl4woUyRfOEPjQ0DwxM9G17pvp5M7/6y7Hk9sWeSZRlPzWle9c36G8urxf+9E7gHxT+F
	72gMnSx9DSXiKmdyz20egEPn2WhtzIo3ExIUvsHg0N7FflkRGoQOzJAqZoMGEeev+mfI+UoXC5Q
	e7V3lWCTLc+CsikWezEJRQA421TOh5LFA8xSOwOnNc6orHvXABQ7S2TOmTxQIfd0TQ==
X-Received: by 2002:ac8:5710:0:b0:48a:80e5:72bb with SMTP id d75a77b69052e-49f46055e2cmr72004391cf.2.1748341420345;
        Tue, 27 May 2025 03:23:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbnFf4IFSyFhIacoOMoDM+QdVT9dgMuaWvHP1dR9WzcAFqNAZ0pAaEKt+/hMSM5QRmaJ4iKw==
X-Received: by 2002:ac8:5710:0:b0:48a:80e5:72bb with SMTP id d75a77b69052e-49f46055e2cmr72004311cf.2.1748341419928;
        Tue, 27 May 2025 03:23:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6045a890427sm4231193a12.49.2025.05.27.03.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:23:39 -0700 (PDT)
Message-ID: <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:23:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=683592b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=vltdqEpKQTMQQ8pm6BgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OxL8djVdpmKJic5v7wXdlFc2-MX9nfnH
X-Proofpoint-GUID: OxL8djVdpmKJic5v7wXdlFc2-MX9nfnH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4NSBTYWx0ZWRfX/Nc8hWrXoCir
 c4X4t+44m/LrrBT0sAuh0CD+HkgFK2Ta9M2g27FDlzcU2Xlqvuk8tvPrRM54p6gpVmTWqd6W8DP
 tsI+i61h5ZyPV28RwJcVLjU8FFTG7mcf90DbhPdjEC1AQ/KlY5SYSxh9N74larxVWmKL1xoAtnp
 OD1MgL3rwJtaMpDZQIkp+a/iiB4s0smwcv0rqYJWM6U4K8KGMF1rPwizsKl4IUWw0e2Wfe2yWqb
 mE0gDf3yJQCIMbm3GIo+EX5qa5Vgsn1xBu01baIgQAGbCJTD8CU0gbpxx+HXXWR+ErlwZSjpoJh
 Pw8DuNQKU9aQ/TnPkWiVjKHqo/BHKmZPnsUi5U0z/IDLhONWCoJgHXtMOxLfpZRDMaWfwTOAAII
 pA3Q1jg1ogHuQBG3jE2rEPe6M93wiLdHwoSQhywOnlOPSNXHahFbDhJz+noj4bozEsIddpkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=512
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270085

On 5/27/25 3:52 AM, Jie Gan wrote:
> Disable the CTI device of the camera block to prevent potential NoC errors
> during AMBA bus device matching.
> 
> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
> through a mailbox. However, the camera block resides outside the AP domain,
> meaning its QDSS clock cannot be controlled via aoss_qmp.

Which clock drives it then?

Konrad

