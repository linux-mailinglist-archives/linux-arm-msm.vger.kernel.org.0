Return-Path: <linux-arm-msm+bounces-102296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBeiBcsf1mklBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:28:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7B3B9E43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE7E53033A8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB11939B97E;
	Wed,  8 Apr 2026 09:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkZ0ZVON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQG2dEJj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904F338A728
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640462; cv=none; b=fVU6Bnfn7BiIj7ZsneY79s1eRJxiFm/x0WpAZQt8hxXYYemdICLycm0J5FcAqilcqiisTMMds+GWUnpJormNo/gpkARie+3rGIVf4RSZWRQhJqF62hsj+AvIdnr2cXlsto6nnxmy1fUxSST/ggF5fQcba140fu1SjRzXWDfwxOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640462; c=relaxed/simple;
	bh=CX5oI2pqEyh9d3ryopeYurnSMROrTwXOKqM3hBZlf5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0kWQj96YQnJ8DPtL7xPeaN2QbqCKiiMxlOp8dh7YlP9xGkEJn14dm+zJoTefyngaTEjl3qKwWqFWczotwE5jh3u3RdYPWa9YrfE+++gTjx3xZ3zxkcrjowt/z9fzXoLJQc1k4e32KJC77Aj1tmSzk7FpgzjMcjL4OUn3BNbEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkZ0ZVON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQG2dEJj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387VRk51259200
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DE4TNUFeuSxLnD3IWqfbxFv3UkmD/RAoJtWjT7snpcs=; b=fkZ0ZVONVJpl8dZL
	Uc6bqguJWU12pzJ80JI++gkVZq0I5OrHsXzZalT0faDWok4Lx8y1YXK1OLb6bZ47
	SXmPJBZlnJEydP5Oe3c6l549cFPGOuOymc/Xu5z+nS+nIDW5t0tnONWmyt9FKTBn
	61ZQRf+xOvkyF8ZdWLsXVnzU/5YUfs7u5VZgHwgxUB4l+yi+aq7A64RWybjcilFS
	29M6cpScnczJL0L+67d11fRh3siVO/7s68gzw+Trpnv89WyiQ1PQ72yKWz3HjgL0
	MzzmDlLJF/4bTO45j/PLv5ug3Ltp37Ijh7+FDNMjJglGLj5y++5aKPg3L1HV7WCI
	uz7uMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttsv0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:27:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d45ebdbc9fso140554885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640460; x=1776245260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DE4TNUFeuSxLnD3IWqfbxFv3UkmD/RAoJtWjT7snpcs=;
        b=HQG2dEJjN5p/LPNNOXj3rhnlorWH++QkmzeKUz3tzh9oz3wlxfwoF18g3Lszil3x0m
         WhDnvlMJDIKny+gqltsbR2k7dRB0bkRFQgHclIBiXZKg+E2P7uc7JVMv2pleqlBIorhd
         SESyo+QGYDHME2rwYeTXMqUtySgU4kWl0TIw+b8Ws0y883l4KQ+p/znUMI+AX0T84oqb
         rlNV/FP7nb/NJsg1rItC/Jwm679dpsx7bJKmeD+Tg2Tb07bNNHbHkTf/dr89YuDdg+yq
         pDIQsaaHFdYO9X/tQoW5ZFV3bpBdYTkjlND+HxIR9o63T4nv3s6XoxGCv9WM00Zk2EtE
         dGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640460; x=1776245260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DE4TNUFeuSxLnD3IWqfbxFv3UkmD/RAoJtWjT7snpcs=;
        b=gkeRLPkE7nM0hqURDy1HCs8C1FZP3j9yMFBmHbRfolut7HWsafOttH1Td02O7SkS6N
         a8fnQPLsHOU+cLmFr7J4xUOOklflRNboa/7VgbiiSdfdrL08FuxVduDF0Kq3rS5U9OMT
         fg7CfZzXiXoyF3Plha8Iy8+csDjaM3UX2EQh5lQdPu7800nsNVlSAusOrIA+ZABm224+
         NhdZUDmvF0LzL7NcKGNqppUbXbyOEl9xA9PhZ9Ezf2RbxpZ8GSeisJKxGdtggQSGiij7
         FKDvMZpniaBXw2hYy4W5pp+kY8yZx/vvQsBeMvYmrIOcRa/VWevrvyiJLAMliOW9ambo
         nPQA==
X-Gm-Message-State: AOJu0YxO582U/VAmrycXXaEy96DC/aHgcqz+MB+6uQ7QRs1kRzYIuIx+
	sH543vZW5mCX7d6pHkwsOCkzAvrALyLKARzGvgv6vohThQnzPGgfHm2H/EsE41O2aO+u7SMG+ic
	t7DkfclTidxKMrah5dPlVpX+DKs9gvcktczPffftC9eor0mbYFBBw60vveEf8Y5utotSt
X-Gm-Gg: AeBDieu6Aq0dN1dYBZ8lpalY/CFY+eOpt3bbqITJ4FQWxZonaitTqvVAaEFclgTlqYu
	K8jq6Rf70fd4lypVK5EdpdnDMTk5LpvMTODr9BZvkCLH/vFT75tpMX6sZlZo94Wz0gbCOPu5QHV
	b2NJtCOJ72b9gWKmzxwPJBeZQJpkdwa/NTeGV6FwYtgnECYkNrvmWnk+3ShDYDvs9eMCOJZALMJ
	DjBb/j+UYB331eh1rkqYhjQxJpLHurW3xTmk5PFycfMzyy79Azz93WGsLVf8xm6Er9Row6Nc0KF
	RVEIX53jErXzigcHYhUrqtmDqYJhSAkmC46luLVCL5scJ0OExR/6oCmCwtdgeZ59ruDozJc88Tx
	fk5HtuQffCFw2IFfRPPU41ipBhKy2qaqGledZsSws2nOmHo2IyJUpR6YhQRSnnnDO0JtE+cY+q9
	YeIVI=
X-Received: by 2002:a05:622a:1814:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50db003635emr32335701cf.1.1775640459873;
        Wed, 08 Apr 2026 02:27:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1814:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50db003635emr32335441cf.1.1775640459351;
        Wed, 08 Apr 2026 02:27:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b9284sm5202505a12.22.2026.04.08.02.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:27:37 -0700 (PDT)
Message-ID: <f07c3b39-da9a-46b6-827c-c8287916ea61@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:27:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for
 pmk8550
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0h_8FUcYMtFCGDnvsydSbDeLrGui9PUW
X-Proofpoint-GUID: 0h_8FUcYMtFCGDnvsydSbDeLrGui9PUW
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d61f8c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=cmy2-XsDip5EG_5K_9YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NiBTYWx0ZWRfX7D/eEtqCFKUz
 dx8JzwRtD2dTQ8Kjpyajea572wv7bujQwZ5HttV5FmiQ3dfXGNnpWGk1QREPPirXwm3c7Zst9to
 uypjOQmU476KrGqAfT1rfHbiYPw9EoXG1cU9c0MJjaV0hmCM/Zfyai29Nm7eAS4NAqSqCzU5Lcl
 XqY61DvbMn0mqvncJQc1rMxf3ESBWC4URY89y98H4rZC0KFU0/+IHXE7QWonJ9/d3uCS8Rdpu4D
 DK+iEKtCvZmu0Knb3BVc5C9EpJyeBJOL9Za6qUznVtCAoxF6LN54zoAYT29n+cEczD26Cc/yB7r
 P5zigdu+/lxhDudcT2g03tWNMY0yUArIf2MLhzNiptu4BGvqjsy9Zf5qPeeV2GvwoIrdFguWjvE
 P9xlUgIh41qQTgM6TO/eOL4GBMECA/P2oHEFBt5EvEsPdqkJdMWHeb6N6mn61bT3lxAx5E9RNia
 F6QztDMwsewK9nzQR+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102296-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vinarskis.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0A7B3B9E43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/26 2:55 PM, Aleksandrs Vinarskis wrote:
> Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
> Register address of 0x9000 matches example schema for spmi-adc5-gen3.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

