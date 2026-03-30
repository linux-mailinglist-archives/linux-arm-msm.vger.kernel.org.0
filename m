Return-Path: <linux-arm-msm+bounces-100713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBrjOtVAymky7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:22:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F26335814B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3428730459C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4753ACEE1;
	Mon, 30 Mar 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZhy279D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmFFtiB/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A7E55A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861769; cv=none; b=b3vD9b8pS3w7vR6zRe8DOzvTUd/cCc2jg2DX56itcnepQvGA2IMMw7YzNDT2DuPioBNXegd/BGHcHDFLCCWQX7JWCqxKGD+1j35MGYW9Rnq0lwH1dVEKXrM75fpELkW5fX0bh51EHhjJP7rBOp9p7x7UTjZV8A11oqUvBWArkG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861769; c=relaxed/simple;
	bh=OvwyzXbnShpiN8wcTQZ0bbmb5v6o15RYgPr9GOVMydo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G02gNrURRPTOzPXKYl43Wj5crqEnSWk1KLjrFMZcbKvzVjr+tXXFTW/p8h3N250+38uSUQbee+rg5kveXw7UaDq67exd25PRS+H8e2tZUQlAn3hx9gnYjmd9nQfMjQyebM2tZ49tZ4qQ+Bv0//X3X+Hcpy4gVxnAuv5Nuj5uAlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZhy279D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmFFtiB/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4LHgF865969
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dFSKLj9GFw2ACIdw/xNWuS8kWhQUGaxTcDRloeigMrE=; b=TZhy279DOLocApJx
	Z3mQC4+wS7JsjgkwK+tsM8SGxDYCoTP/S7LnZDOKVODzIEd9zLTlHGvoTFfue2Kp
	H6QsfVfm86o1ngf1IbYSkFlT4boeQqkVaZOCD7yP+iVfiQSsXnwcz9rs82PdzRsw
	5NE3tVuYwqiqNkn2i23g8zEU/Go4dxmaT/8gpJs4mn21/DhLCRrAMmq6ZDXnlQXX
	doxsnkAcdkAp4+2eVWEjm0S+Pu3nWSIs1IxGmMi4t6IpcoonRMmpnNA3KP62h2d1
	TEsovmTk1YW/cG3LPu9lx5qNqyMUjFu48DR2hNFTJItBI5j7n3nDzEvfiehQltEH
	nPikag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hda60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:09:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so126161685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774861767; x=1775466567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFSKLj9GFw2ACIdw/xNWuS8kWhQUGaxTcDRloeigMrE=;
        b=OmFFtiB/gM2Sj2R9CqYiKCm0K2zojznDRjFSywYfZ09Hv55EYpktTjtKX4xYinHbNv
         C3wJjGzNvkgWi/s8jRCv+HRcoQToAB6Kvw2Dp4E8jEXB+J8WXvk/BfRkZ9AYMbj7pPGy
         Z3wU+GL4G5Fv17GeRkleHd2aee9j3TGTq2/GSoZgsUS8E0RH8ZbZlJYnXedunaA3k+sG
         m+L7ttiwqC2GFMEHxnwlSEaU2Po/+Lra9DNArEXdmzdJkF7RaRf8kvtUzXjJDT2q5aDq
         RgtME2aMWV6HpFLJ1XBLLrS6R74pmsHyO6PB1Sp40oz4Rs5OxChcko3aELn/I+chp4kr
         Lcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861767; x=1775466567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFSKLj9GFw2ACIdw/xNWuS8kWhQUGaxTcDRloeigMrE=;
        b=h4DN3ix87RWJ/2DpaaQeSNOZcNoiyZA0t1QlTENx9P00jCpEHAzeIcUheK7K6ziipS
         FVp1GSHuJ7kLUcTH59nApAvWY7WJO1Ar2KYg2+A1mF8+W/Q3XPmf9bZ8P4dF66nbRQpx
         NeNcOhuApJ5ruaGt563hsrjiS581GG//fqfNgk4nnSZ/QsO/ABtpfLP4LulQZgVMnQj9
         PZH//tLsHHWpkgWr4q4GSxdtJJ8S6ie75YGFxkJuowiZa+cuvdsI+c6h9Nnk1amjYGY2
         vER7GHPSJhEy4Ep5pzT5p/sa0majzGltWtPggTN/TYzOKC/M/eLEYgEIISx45dFq7eC+
         y8xw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7PQSiMqr14Ghiemyx0aWcK5p51XU6xjCaajJEdrU9swiZU+HwF1xY7ZwfCOABGc/fhtgyD/tTRkvI6wW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd4gvinLkCJFdW5JYJq1oZxelvjuOr/ilmJObzrQFxW+JUa3OD
	RpNdmRyhTCaSxQt+ztE/XJyOitBS2JfrBrJcmeKc6uPiCgW1uXYi21g6/t95fu8K0VynVoUHGyN
	iTCawd2lyYkhvmaG3p7/awbKY2Ndw2K8qYWBHat8K+TdVUyjiUpLMR+HA8msqFbyR82V6
X-Gm-Gg: ATEYQzwz311j5BKK5uP3pVyExwmHQvIKnyJYs38+gxsOkqiwobYVb2P6UkRk37bIZW3
	8fI4lzDy31WIifdUSAyAK0z1sgQ0EwQ9saxHr1nROu5oI+dGAOuVwd4JtQ6gZDUXr1IkCGK8avh
	ugIjACGAX5PsHEVa8zZOnuRpdvcSAqO/0WB79mqEfXT+W7mJjGKboEAgOVb/8HuSFhBykQUuEKG
	dKajGZzGf9WbeSOR8j0U8N1UAEVuliMVAhHs6/wFkC/7D0y4b0eTJhTaL3awh3FEJbK21M4T9Y6
	VvTGYKBxGAP7bKRdeAdf//523IeiFdxPhvkKrlJBGqFvBIc1SnyIvDvwPFsFLbjpWN2BnRb8uau
	Zg8p40rBqPrMlN4OcXe1iArS94w/Ryf2IzHMA9oLCK7k40OIz5pfNng/c1Yv0z5MBwrOxw9XQM+
	f3ybc=
X-Received: by 2002:a05:620a:179e:b0:8cf:c4d7:dda with SMTP id af79cd13be357-8d01c5ec889mr1150105285a.1.1774861766950;
        Mon, 30 Mar 2026 02:09:26 -0700 (PDT)
X-Received: by 2002:a05:620a:179e:b0:8cf:c4d7:dda with SMTP id af79cd13be357-8d01c5ec889mr1150102885a.1.1774861766381;
        Mon, 30 Mar 2026 02:09:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b8218aa74sm2162271a12.15.2026.03.30.02.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:09:25 -0700 (PDT)
Message-ID: <f2730429-a18e-4669-8172-479340c33030@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [question] soc: qcom: llcc: llcc_v1 sb_err_syn0 offset (0x2304c
 vs 0x2034c)
To: Alok Tiwari <alok.a.tiwari@oracle.com>, mani@kernel.org,
        quic_saipraka@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260329173801.1471583-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260329173801.1471583-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca3dc7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=fIdSkUqeGEuhFcE5YsAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MCBTYWx0ZWRfX6ya4qSaPglet
 qXtLRj5hqtCKG/kMsWua7cv/rPOHt4acyI5ACoK0eMYgaas86g26o0IsPRVx9aQ8FsqtAY7Ee+Q
 bAITJO3dbWHNodb27U+VEr8mOm6XPb31DfUYr1tgwsiWJbjUwVunnqeX1O3yyzj7gRnBNboyNiw
 1p3Bd2NbsyzsFX0ApFWuVfLDQI15eFYFusg/xitbZyJGy3LoJcgbBCA9Q7RJFt5CKQiy9qkQIMB
 9yvebzt0XXlYVd1qxkygWAshGEAt+5NlbCbVcdlGZeFcSm0svQVChutbYPYBEkMSqSfJVusoCA9
 U5vDHjfU0167v6RFGReDVoWqJV8vy5xUyjhAlP6sSNzy08kj7hE9DVVAElSNIMVTic8M0xt/j+B
 SFSg5GAFj7qwcsZfRw0/WKMFHmHMhEVMpkXwwJzxnhrYf5dsMscmpRhz73r05H/rAfCS1r8XVR+
 EMY7rZiAVqOV6PYbfbw==
X-Proofpoint-ORIG-GUID: nXcyAj0lN5njEWn3oDb2s0Q_MbtGJ61D
X-Proofpoint-GUID: nXcyAj0lN5njEWn3oDb2s0Q_MbtGJ61D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100713-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F26335814B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/26 7:37 PM, Alok Tiwari wrote:
> Hi,
> 
> In llcc_v1_edac_reg_offset, trp_ecc_sb_err_syn0 is set to 0x2304c, which
> looks like a typo. The surrounding TRP ECC offsets are in the 0x203xx
> range, and llcc_v2_1_edac_reg_offset uses 0x2034c for trp_ecc_sb_err_syn0
> with the same status registers (0x20344/0x20348).
> 
> Fix v1 to use 0x2034c so it matches the v2.1 register map and the expected
> +0x4 progression from trp_ecc_error_status1.
> 
>   trp_ecc_error_status0 = 0x20344
>   trp_ecc_error_status1 = 0x20348
>   trp_ecc_sb_err_syn0   = 0x2304c  (current)
>   trp_ecc_db_err_syn0   = 0x20370
> 
> Also, llcc_v2_1_edac_reg_offset uses sb_syn0 = 0x2034c with the same
> status0/status1 offsets, which suggests v1 should be 0x2034c as well
> (next +0x4 from 0x20348)
> 
> Could you please confirm the correct v1 offset for trp_ecc_sb_err_syn0?
> I haven’t been able to cross-check this against the register documentation.
> 
> Fixes: c13d7d261e36 ("soc: qcom: llcc: Pass LLCC version based register offsets to EDAC driver")
> 
> Thanks,
> Alok
> ---

This change is correct, nice find!
Please submit a patch

Konrad

