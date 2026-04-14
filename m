Return-Path: <linux-arm-msm+bounces-103081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOC1KGcI3mlRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:27:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1663F7DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 110DA30215AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978823BAD89;
	Tue, 14 Apr 2026 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFUxm4fv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OX4apoed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D73B9D96
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158820; cv=none; b=bZbreFY3T6nvRKcnKYWdARkoQa/Jyc/wLe14swTa7GoSyUjh2hAu8Rg5vdSPzEuU+46/SeUP/KxH4ov3AvnXE+2pLJTxbx8J21qVifN/RLN0kTygw9ZmExt5e1QfKKcN5EDaqdtbQrUFvirNGPWs98WRopD+ntCmIItLlK5LQSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158820; c=relaxed/simple;
	bh=93oFKmYp7wHHg9yJdPnYfsIe+IsIeNpLTT4yPZpxlT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uk/5ac2KfjBKcplXw+Nkknja7Gghgal+k1fwL1UmYNtQ/3ylCxR0SHLXVFuSopL+/hbCQKSeqoLbCK+8NbYsP4EfPxSn8Lry53edDrX5xoSmrrlIaKjQsku9odFDhyebvT37yh633v7rYE1xGgBgCbyngfjfaI9Wld73gyKy3cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFUxm4fv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OX4apoed; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6Vo9J2633460
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xSJ7w7ShQoBCDAOFgmsszFWHe8vzZHYcqEZOoHSj/Bk=; b=NFUxm4fvSaB6GSkR
	h5jdRBByJeewET/65y3UAbprGwPta4CQ1HvuCFjdGsqyH7mmZFe2/64ZJzyyjZPw
	/0sWMOyqxVrlczZhvwcK4f3rRyCY6AsRjxrRqsPB0SP5ITwgCwOqvbu47SmTpmI7
	sYgLXgnfB8W1urXOHabnqD1SJbcthUHJUIjues3Ie3Hmfl7V3LcpJRmKkjD2hxWC
	WqmPuKa48RuZH8rwXGvcaSd9hGvUilvHbJh2uJS7vGrk47eDb70UNKtgAoa0lDzv
	EA+/iPenYG9MDnfIvC571VKs6VzCIy/nO5OWdItDEZ69wuVMxFHY+SoaoJr2gwCd
	ZOlN8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca2s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:26:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50de490b092so3188141cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158818; x=1776763618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSJ7w7ShQoBCDAOFgmsszFWHe8vzZHYcqEZOoHSj/Bk=;
        b=OX4apoedPl1jnaVl0NJRfVx3IilxuQB4qOi76wBGK87FBzHUrTkKK9AejCOnJaHg9E
         SPVGtt3jfhdTHRtBN0bs4rZtuU3JqYaKws878r9TK3Zh0kz95QK6o+LXaDlF/oOCDaPi
         sxDPkjHLFDhVdMbhs+MB7Tg15C1xji3gctDzJ7vppL+xIa1TUDKbgLFcqerQ2u+R7/jR
         7z0Pe2sPYP0TRriYXndScBxcxvAfOUCPIgbuXHPEE1eQ2Wo3lZ/2trPt8Z7e9wzd7Wvz
         LUtYa5NtxYFHbGS3Q68xXmpcAcHGSooDg2zFvfXZrqSVj8g6H0eAje4JTHv8y0h5Z8B+
         z8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158818; x=1776763618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSJ7w7ShQoBCDAOFgmsszFWHe8vzZHYcqEZOoHSj/Bk=;
        b=lcHes7RJPX0e2tns78RNcpy9cscN0CyPNh//7ME/NRdKlJ4A5iNXWtjoS+QuBm3tnR
         E+hqs14RVzH4Rj/5oX/SsYkOTYKcldvqAYi6F8X1dPKdV/+IXnCcHHMtckUlw1d8UOQi
         hLOQ1rCQmt72QOrZid+Bh8rOtcGP/0QkFEHUeHlw3RFqjfWwM5ZnmFsxXgohmaGegeGR
         sp3QI0N12bCSl/GmKwo5iLE8lkVsuxNYTtcgct8A3GVLuF8ZabYzyXQBqTpXk4ukA/IJ
         wFt5wB7tCPCSWfxC6vAyy3vfqnEivH0LA3K1PX8daVyVsVDou0u7zGwbzmUL+YG/NV8q
         euDw==
X-Forwarded-Encrypted: i=1; AFNElJ9V72H5hV2JZLEmSVCQfk2I39PyiYRGOr1tU5cmh5dNWbRcpeVp7xz4grrhZf6PJNky0zesID2hOGL4pMKP@vger.kernel.org
X-Gm-Message-State: AOJu0YyyEU3atcajxVk5XGX29BAeX2rRb/M9q7aibwpyIjHCmbyzGohl
	bJrtNGUjZGTGah8Aw6VeB/fXKhjugPUN1nqeQOX7wn7hYwtLdJQlKyp6G7t/b03u9clUOulEkQ7
	JdP7yU95zAXr0RZI1RRy6q8ErQZU5Uj+KA5kFs+orc8uLf/Wn7PKY2hu9aJrQMfg1vFUy
X-Gm-Gg: AeBDieuSHyFnythWh7auuauMuwJlmMpWRiYwMQzyal6l5b0X3tOSB7MeipbatTvfY6Z
	A/BDd4Mj7af/98r/+2sG9hkVaT0U3QyRG1v35CXaBuqGL3vmx9wvWGu4cnACj8vMjLConVXq1+l
	Q3c1HoA+8U8IyIdjm5lCWyKtwkAxwnnOjK6VaXEW4mhqTf2GPjwusW4HLD4bX0WSODLf4Jh1oCi
	sGXiur1n7b5MR1paF0Vto534S8wZsdyjC5evrDvDanRXvLLAPL2N207OXbXuB4yF200DdOs7BtH
	lRczY8J/WwiXJSABvMx1mPTkQkvtdfv9ECqtwlSatr//16cFav9VSCM6dzdEWA6uV44I1cEKueh
	d1UtnGc4LBnGGD5+yMHhvN9x8QxI9+o0ZbUPVkOlrehh/Y+/nCUjEK44xRFuAJYsUTWZZzoakzA
	bXf8goIMPoMtlusg==
X-Received: by 2002:a05:622a:351:b0:50b:5286:f757 with SMTP id d75a77b69052e-50dd5cf408emr165073271cf.4.1776158817709;
        Tue, 14 Apr 2026 02:26:57 -0700 (PDT)
X-Received: by 2002:a05:622a:351:b0:50b:5286:f757 with SMTP id d75a77b69052e-50dd5cf408emr165073061cf.4.1776158817264;
        Tue, 14 Apr 2026 02:26:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6db92792sm371663966b.0.2026.04.14.02.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:26:55 -0700 (PDT)
Message-ID: <a9db0ace-e93c-4d2e-b9fd-b669b0f82d27@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:26:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: power: qcom,rpmhpd: Add RPMh power
 domain for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
 <20260414035909.652992-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414035909.652992-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uOAC9IBh4AL2zFsQzuRXqQ2D1FBNUqhc
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de0862 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TW-xpW1wIl9TmZx4k8IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NyBTYWx0ZWRfX4Zoma5bDKQQL
 tLrM3V6dIXSfz1S01CJ5rFpOndblYbQtMotR7KrskqnB3EXwMkv/sJCKGU3whPCkkjGyR1KTcRL
 WCEKig/OR8Am5/pan43OHZUdT2mSsjCD/MJhG+lTGrUykNcBo/ZdfrKLzEwfIXV1me6LpXDgc1d
 dLgRMSwhfODHb/7NafXTy3E+mi9sbHVx3kltKjZ2Ozo4Lez0oUm/+wHhvCBYBaaKSalYnPTwy0D
 ZaRWWDFUkRO739MnUTGSFokzdMgy7zB4k1P/QO0Zc6cP9i8hgA8V8v1redgsyjSNE7XJs8mxs25
 ipQxY0BNDRblvbe4CFyt3MLn8PYHSDENUzU08k1riHZwVMcTQ3F+4+dAomrikSpS3SF1FlHHwXj
 qFN6ClcCaZnMRPYMoEtTHdsTviklePBeK3egLSCj6MjRbrShnlSrBYMMRJTYiHzgJoWZIlB69z6
 cldyUsh9AHR54sF0s4A==
X-Proofpoint-GUID: uOAC9IBh4AL2zFsQzuRXqQ2D1FBNUqhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-103081-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C1663F7DEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 5:59 AM, Shawn Guo wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Document the RPMh power domain for Nord SoC, and add definitions for
> the new power domains present on Nord SoC.
> 
>  - RPMHPD_NSP3: power domain for the 4th NSP subsystem
>  - RPMHPD_GFX1: power domain for the 2nd GFX subsystem
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

