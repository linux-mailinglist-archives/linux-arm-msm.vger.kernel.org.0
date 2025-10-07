Return-Path: <linux-arm-msm+bounces-76254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D151BC233F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 541C63C6E34
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5315E2E8B6F;
	Tue,  7 Oct 2025 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPkjPhNw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A7F2E8B63
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759856191; cv=none; b=lPc17q9PYKWdcbU4srz+9dkGf99yg8krbQd6Uc07Wv00owc1xliCqABFsFJLR5g2Bhd7elZ6LSkoMtCONh3zF0+6ydscT3ILSuEVYwjnKrj7KIrFml+LL/xYXtSvoBymPGD20LLWGBKxJcNe7HMmLqFP+jfQ1Yk2CbZcS6evEnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759856191; c=relaxed/simple;
	bh=TSSojGXB4ZCKUdafJHjPMQtblJHLBPT4c50xH+fQ234=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDCo4xaphDhAaL0xx+7GaFPoVi7tdZ11YROAKSFr+RNFV+NFytKTOqKDwduDjiJoq3U9PFG1YlsgLm9OHorRSJO3g4o+HjQpnwoxMonBo6KbQJfRIwqJ7DC87wsX96CLM89xTOBhzxlmeSOvYEKCqbYufYanP70vMthtFOq3toU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPkjPhNw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETCJp006807
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xj0bCeFa5Gd+90grvrhkEam+EB/Y7rRFAUz956EmphU=; b=hPkjPhNwQz1JN0Et
	TyLybKO5NEa/786LuPNKmikbV2A70PhJ0b6+uRuqKtJSFOP+PNcBbyax3wmGSmie
	w3kOYfw45PzvNyCBwQK4jUWyeU0MsIszjz/2zFLtSj/alUaSIzEPPQSAxFbcV0EJ
	///yxHiWk0KZPjmE7iMcbdeW+2+7ivWmvOhPNiDdXD2TZTJagR2YtYam9aGR5dfv
	XV0Wfk8gNtEAKj+AGa/7Nj+ZA9tWUldBRLXH74vX09zfjSCvhGe9c5eRgYArvO+p
	tFego89QUflcPnbWfeQAvwe1z5aUP4N24nt3KW3+6HtOYCNegN/ahjYM8aBbD92M
	naK16A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1qwja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:56:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7900f597d08so2432609b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759856188; x=1760460988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xj0bCeFa5Gd+90grvrhkEam+EB/Y7rRFAUz956EmphU=;
        b=AeeJyHldsEwn0ORFn02F2FNgecZW1KzcpkfjL5g8lqAP+OXq/0UxYg4JjEb5i83hAg
         htuCuq2gHEgYG2NUW+K3ACjEeSU1sTRS5iZ7Uz55aZ3hhAnu67oLHv/6rNwt5FwX1+1G
         gEo/Uh1gBJ4j09ixR00ZwJu1xgIZfk+PQsg77/lwaAWYQskEX2Xk8bhLAaScTux7jbqy
         fnONRfb8wKSG0gv2VA4xlfMNsQ9eHDy/nhVbgpK9bnrGzxGnUkH2OZ4x/nc1aO7N4wq4
         XwmZyiVURIsJtSYEiaPbnL8jppjZcasApqZyMK+y7ABeGfKOCwLMwZKhfsKAkYtbxrBF
         ciYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTus6ajJQUABW0ID3GFZIDADC1EAsu96w1hNET6WkuXV9ozB6Jc/4JznKytj7J/yi/6NODRddNFRXUx1qH@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdRVX4ibhegUHtgeKXoNaUUt8V5cr9Dcpg2a+gmtbjysKQTqp
	rGezekyR7B5yW9oUBbDG/7MRrWXW1YtWU4NCFPmymQMS+tEN86FNTjTHAY+prJb5txB+5yPhvOR
	DlRUVucyhZcQgEd9cp2oMBEEMUk+gSs5AbmRselPg0Q0j9MRI8oRg8uGESYltBWvBZzlG
X-Gm-Gg: ASbGncuBqwI3mU4h1pGHLAPkt43eDb0WU3NWnwotG7LmYu4CmYW64OF82JnCOSH5qIi
	uO6bzH04auxS8dcH5PGCAEnBDRHgoBO/3uuy1kw8BlVydHz7CKKlWvaq8iUHtXE8OvBxyQsJbX7
	sAkfqbWl/FqyyG/72NeVubLUrxYkE7247M1fGAs0wpkbvo+MfWfQ9uANoyaX4vCJg0/NGJOztfh
	XhosxU1iiPJAT+hMm/MlLCTsFJhxD9YFPOfCLzlBhR6sXRoXufhytrtOKwh2FzzXKEhdNyLxRMu
	nmy5bNK6muXKEzLSercVSnO6TpWs1bgbxj5HYeP8+56qxgtz57R+15lFa+7BLrsR3480Z9xxVdl
	f6T06A8WrGt7pd4TYnJ4=
X-Received: by 2002:a05:6a20:6a2a:b0:2e6:b58a:dde9 with SMTP id adf61e73a8af0-32da83e59f1mr322613637.40.1759856188221;
        Tue, 07 Oct 2025 09:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6jcZsIwr0116rypVqpIXcuiblJ44Zbn8/iOBv+jsI0REI9Mgb0n4FtlA8GegIQgpOShaKrg==
X-Received: by 2002:a05:6a20:6a2a:b0:2e6:b58a:dde9 with SMTP id adf61e73a8af0-32da83e59f1mr322569637.40.1759856187684;
        Tue, 07 Oct 2025 09:56:27 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099af2deesm15681209a12.12.2025.10.07.09.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 09:56:27 -0700 (PDT)
Message-ID: <12b5d459-946c-4626-90a7-928e705896b5@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 10:56:25 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add QuPFW image entry for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007161733.424647-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007161733.424647-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pEluyTZ1RjsVVV2-siqQJb9M0W5rqpQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX/g8c2ESKOK0s
 WUBFEkJYPnj/181Mcch8MDyqOgwxtFsT7Yt7RMsIYmALTLexVv/jd/6aqgCrucN1PI3WJv/c7Kw
 LzgppbJ6WtHF/sG4V+SoIi2UDuVDKt905fcoA3ZxbKLTU71pqCEMqCAsBC4wplvS8STabyYbVp3
 zaofdqSc/qGi0qPdGUTWxuIK48VncMGH16GP0yRaIHpzPYJw+p8B6F/39iSeO0GLt3LW65W9e+c
 5Gb6Yc2+iQ50Nt2xF0GzHw34MD5bNbNMy5Wb1fJqdMuZT5hbLjm3NzrkAYNFENFuqNhMObNnK8g
 KARFM4ALOzuv8BiQKUH888aBszN2mjPHevtMYJp9uv4nfhR+vIHIoj7qK/ECDEuSGKrqvW8e3jq
 gi70LlWcZlH/01jD39faBtwqgN7dJg==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e5463d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5fljqs_j-1MQuW37vUkA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pEluyTZ1RjsVVV2-siqQJb9M0W5rqpQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On 10/7/2025 10:17 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Update the Sahara image table for the AIC200 to add an entry for QuPFW
> image at id 54.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

