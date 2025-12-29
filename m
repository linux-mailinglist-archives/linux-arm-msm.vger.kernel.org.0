Return-Path: <linux-arm-msm+bounces-86823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BB3CE695A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F3E03007CBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F9130DEBA;
	Mon, 29 Dec 2025 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXM4as36";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQEGy6gF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DF530DD0E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008706; cv=none; b=dalrE3Z0/vy6MZwcoYJOwIuzu9UvusBXVAjR6FWQl88iLqU3ruI5BZ+QL+9HtC1h4qJz//JpeIZU4fnetlRq4KNF1e6d3BPdWJmgs0xCQ0CXkucmMUMTwkKdfx79LslU2I5d4gZvfLbv72B5OYFOFFy/NFhhL1Ty61/OqxmEVO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008706; c=relaxed/simple;
	bh=dzy13qrj9gNOfWVk+f9fG0zzLtDEbH1xmJsZR+dQhu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kYnKGHTcMFRURmQeDEydGJ/WKVmgXPPTKkDDCLjmMXdyzaCoYtTNm7Jef3cBY0YAebHTsMTFcjI47Heip6cUYs/lPZhvB99O5g/ZpO0XQ6j+Lhz5dZFMPEvIEiyr5XS0M/R5vU/sozYehE1IY9opp5S1juZYkMJaOaXRmZ3qJSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXM4as36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQEGy6gF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9UUVt1243307
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ucAJJrnBjVPWWwtZNg31IitMUWwp33Ja0WFe9A2IcQ=; b=GXM4as36hGtfQEt4
	XnBUNaKF34VMg618YSoDQ4DrMeHaPcAtzAZurMvqdLBYfF3b7mE2c7zrkvu0fzf4
	f3hXUBS/Y86O6ktneornkK7Zz8228JQj/Tz67sBwOd/oGSGF1Udbnwhty0tfvo7R
	JT29j9PF+h9ISMmTy2skB0/ev1cMp0sIK+F9XkZLvYvqIW/CYqpuxSi51pY47beN
	5LwLokf4Bgn6mLY1+aOS244EHgnQtfvKEeyyGVEur8erDbHaBnzt8GFCdFK1CTUt
	albXuSdCJVWR9msF6sv/DBGnmoBc+sZ7ITPOB4HxUUQhWhivzjA/JxGd9fpX4abC
	3yo3UQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj2p8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:44:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f357ab5757so41386971cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 03:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767008696; x=1767613496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ucAJJrnBjVPWWwtZNg31IitMUWwp33Ja0WFe9A2IcQ=;
        b=iQEGy6gF1OKDyM5qYm/lvo980uQlRVBv5cNllHens5DO30/euselnSzSe0k1S69HqQ
         HcwGapHYz+1WwJc9cpunHQ+eSbsGoZMwjYbrCBhPPVE50uwIy9m2fzuSmWZWkZLUlbe3
         h4oHXgjqNUKRVAKtw73FumwhUjSpZAa4xRYjpWSTD5+pZe3k/soyOe14IfcE34gAX6xD
         gX/dVGsowMkhgdt2ox1Iqh2sviaIo+OGT/H6gU9jehnJZLyylUhW3/5TJqqOH54QPTfE
         62Q8Ra/Fqqd6Eu+b9NuDzHpoJr2QHOhqfygKviWZ/aJmOD8+ipwyXu9ZsmvuJyyCXDm1
         F80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008696; x=1767613496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ucAJJrnBjVPWWwtZNg31IitMUWwp33Ja0WFe9A2IcQ=;
        b=acF+lQ8KapxfqbVt4AKcslhp5+D3ENOcuChtgC7nbxhunKOksK5Ba+rWuYqYIRIOdf
         T7GHP4+oruGfINyzQo/12svvtphn6/F3hQzwGTM9jKp7n+SF5g8wZg52j/m5n44r6Vp3
         bH8Dkdw4n5Ep79KfonuheSFncLB+p82qVGRBXQl24dKif2dkD4qfZp0pDBPs84g/ft1L
         x/xlGi0cBAat2/JDJ+7oVIYAEeW4uYcWWoPSfFCH0FXpkOA0RP9JRinZOGERDqDYF1+S
         5cmW2hU+LwwHiCiA/4PN+SJvzHnOfm3eVW0XVP7V8ePd5AwaHn3t+XgazRbVlwqfuD6r
         641Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgxZKyb0mMrYrAUAZRDqXKPRohN2q4UMAG6CN9nXyjnW10ZsFVuVnUBxoN2PZNkgd/8rRfpA/Muf8+tfoV@vger.kernel.org
X-Gm-Message-State: AOJu0YzyzBNb/BFdTttlOzjHCUOdyNuVLKEHbXwQ2OQW1nusSAYcImzF
	nRcL8rUz6+fvtbWLQbLCZgFE4Ivpd83O+J465CNPkSSd+G1T9NoehKl0/t4/xLeY4M8pgu2lWFd
	7i4606QAOQV2A7vBQhimCS9lwZvsWw9J/GBxsjnp0xbkVAhFXHYzMHBlDvPGiuh+Snmkt
X-Gm-Gg: AY/fxX6zJxlhcPDmXdkjxcdEuKmfe6+Daffllu1L9TgqhoWlEHUdcAaf+OLMjGZxHjG
	Ohdz4OJzzKVabc9UJOFHaXteix3WsNXtuI6JVlQI1gGZ0BZxZ4iA6phIY8PaGsZeIhKE5XYNjn0
	jVtBU377KS2RkwxgE7bwHcDxdGqTjpVT6WkaySg9LYP+PhbWKYHdEq/W5yjRpN3CRMTZ03NJ1yS
	VXGY1CcGsbTcpTv41xDF7Vx5EHLNoQS/25ijzZv18uT7NVLnzmUtxQSaJG0Zi6R2BWg22xU/sKS
	Sm8PRstPHgm7OI2A/6/vOKpm/wQB6vq+uxvu3XS+c00ZfsyCB2+6gJhMk5AufAjr4i+MqM/q9OW
	AIh+SNMCP6ihPq72L3GxxK+q9oXg+eOuX+p6nkLcw25U5zEQmwKXLZarbJYuzFsgpaw==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id d75a77b69052e-4f4abbc06ddmr320398631cf.0.1767008696127;
        Mon, 29 Dec 2025 03:44:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA4JottHG+Jxzc0G7OmGsV87ONcdkVvVeRiYt9/yXxfUQBT1GQWAHX0HTrLAGlJKNNpbK04Q==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id d75a77b69052e-4f4abbc06ddmr320398451cf.0.1767008695663;
        Mon, 29 Dec 2025 03:44:55 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494cd7sm31326686a12.16.2025.12.29.03.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:44:55 -0800 (PST)
Message-ID: <e7f7878e-3b04-4276-9d16-b19a4b922d6b@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:44:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XfWhk_aHTmCInI-f4dz5Db_yAU3JrFeJ
X-Proofpoint-GUID: XfWhk_aHTmCInI-f4dz5Db_yAU3JrFeJ
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=695269b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=486DEghy8GcDG8TY6xEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwOCBTYWx0ZWRfX/KBBulOptRa5
 IJsWLfkKzK0dajUFcJnCgXWmoHZOkeMLthUrrFR7ds0TpnjIlcSROgBKLwauy/DGRHIQPicb2ov
 Yvm0/iIS/NIBMEtvbTT7DWQsC1Wp9H8SnMn/CQEIleW3ejL7sxdGseaj8nbvWoMJcJYTDGOcM0d
 TxjhGJ6X+1wmQDhsHKm2880FNIWsO9CHT2bpLChCktw4o7RqOXrPie38dmtWYNYjJWlw+ED1V+p
 ObTBTaT1uzd/lRMnjA3qfdbHixLAeliATSIcAT49yiQxRa03chNUrZthSTILY7sdyfceETqPGVO
 NjXGEwfPkaQM05stYBsCVrK+cTIKLt7+CDH/b3SR5fqLy8oCUF9rpgSJW5zIQDlhYueLUrlWAfx
 TAcKBaMJMON+cwLqKhqnhiP0vNINzFA05Mxx8iEtzJziKlr7xaAwoENowC3dCtglTzAiWH0/xkG
 s+5DDGp63wJfJCEetjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290108

On 12/24/25 12:22 PM, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Too bad this warning isn't enabled by default

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

