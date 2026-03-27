Return-Path: <linux-arm-msm+bounces-100236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BfHJkdQxmk2IgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:39:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594F341DCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B26AC309193E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DBD3DE432;
	Fri, 27 Mar 2026 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqouCsF/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqGATYuI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C0D3DAC13
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604238; cv=none; b=Bl5HMevel/hW8gBrB9e4FmXC8Fsn32amoId3CCyr7OPN5XlPAEkdZ2MAfB7eMCCUj/+/qmczilEOKSl5KT0WtpbadG2fPSqvh+obzvy2kVKWTirRQqU/KhB2XzOXjUJUBFgrCHrPpUJJi2PJ8uYRsftqB4KU7DOjWyYcxKfchao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604238; c=relaxed/simple;
	bh=lQ54tNyhahNf981UtrtQ8c9xNcpge8AGj9UwF+P4TEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3Y8bm8Dlc8YI7t3o2AOS/U85HPIYJRVxF4jRL90txEjj151A+Efo389QCtWreAw4/m5CSF2EHCSu8B/VMVHqLUbg4k9nEdhMM2X3akCe+gn8XdBANVm1cwyP0IGjdr43dtj5uo7+mazzM/k4MSuLlveVAOK873/BjiIDE+73XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqouCsF/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqGATYuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wEKt1710556
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1a0vPBy9+iA/IZEcVrDWkc2KTFbkSsKnIAGvsdKzx1I=; b=CqouCsF/BSHA/4Sp
	I3lspYnwvcOJBCB9VvzvgzksbD7w1yjFOYl2dkSbNs5nwS2TN1Bp0nu6ey4FmXpY
	xSdxKWRumhwj6qDR5bHBscdPJ5oyaMDs0nd5bOlOfsTdkACBbLm5XhgirQIMhBcN
	8GqPdv3L4oY+nHQd5IlrlGYBrdCJuDiP6UQTvAa0KcBOF6K1eqKS/2JrFTT7iBYJ
	p+x4u7giiaE3IWI97MxnXC8bTzgRdDyDgyAjUCZbSvCIbGr7cHNzICZ48ByDvyfd
	C3M/v63aMdguvV7oWbSTugfAsL9qZU92gSxiKn+XHtmpHGiR/edslSk1jBxUYlsF
	C0LfcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvjdnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:37:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so58235385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774604236; x=1775209036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1a0vPBy9+iA/IZEcVrDWkc2KTFbkSsKnIAGvsdKzx1I=;
        b=kqGATYuIYHUu9nAzWwacbA+VenzSym92Et7isGBxEk5xNaA5m8FliAuf6zbPzKaNg2
         CDfW4ijkNmpdY1vts0KIFtp8UFvLHZMh4gNAi1HYjPtT0Ogng0XanvOl0tUqJczFjPVu
         9e9GaGa1UGZQQSSHwrXjnZ4o+zBydNs+ddpa6q64R7cf1QHRr3Es39hcg6c5L4Xrfsw+
         8y6b2IGD3HExsQ7CvjwfRulVhR0aa7PFoDC0rSKZGDOc9aCFZU4cZhNPvrduyM+KR4sm
         kvPEmh8W4JRAPtbtGFk0sIxT+YSUQAok0fIAmU0YPw9+m8lFs0+J45X1hY1q0WHcp7bY
         8qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604236; x=1775209036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1a0vPBy9+iA/IZEcVrDWkc2KTFbkSsKnIAGvsdKzx1I=;
        b=sxK8TYlBF9jTJj0ygeQBG6ZakuyijgeE3+qLbUy9GL5xgVmn/9raXPy8ez3FCcUrF/
         1CWbgSZnU4nZA0iO2/wH3ZILj4OGs6nFkTgD9ctTqensbgYbiImBn1wTcNdps0ycmMg8
         zBtzIBcVlvYpl6ach8rBfrk4jU5xC55KjD3jwXYnKlcZnUfQOrGYykT9DVBJWyJkg7Am
         KY6trgZxE6sB971JJ1iJSw7bKODFhn1idajpULCgknlDu5PZOBZy9ukqUeKDbJbNzP4g
         U1LAy4XtSawTIrBy2duJm/TfZgvLjhrk7vMiW15QKsW2jYIyK7jjmiZUXSi4rb1mJhPw
         54fQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9ioPWAsvgYuogTxYin985jU7O++/UcY4pbLe8c8Z9gLXDyNc/S/MMo0TCqwFGwo9EaEX6zalxAWxi++kd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2uG3Nib7jPNhYKZjRTKwUTyTw0APQ9F0u/ZzIO5//sKHLjEik
	Y+SGHeWDpKW2SG8+UcHNCCbZ9OmzTLkE55ZWy+roUSo/6gEcCirLss1oLmmfHgfjrcXN0zf6Nep
	ZgALpbyzvn3oY5t/2HTt4MH58qcMIt7Gr5nf1tL1zhd7nnyRWsNy7mDGPWY+QINbrDIrL/NgAPc
	oT
X-Gm-Gg: ATEYQzxpR409QgYKHmXWIWYzAFjLSN0/Y+z2DNlpxieaayozwEVTKG+7FVQnzW+L8ne
	CuNlbYjZYpVvuXe/98g2Bg3SmxgP6fp/ixG4kTbohsbgnu9gcEyp/XCZDYAgxCnr8oRXS01tLJQ
	hMU+P/rNADHsZ0VsHYMc1flB/y0/zR2pWSf+wQ2RMilkUNyvVilKMptfNQu6leNWR/T7+Op/4t5
	aL+Y+LkIyvpPV3UmFFAyUVbhNUgBKMEdMfMsPjFFn5LvsQZxruTCsXwdxWsch1/9YR0XSW9GacA
	1kv6n7wyWeeRcMtotwSnZVsizWoFSy5IOo4EFeLIGZs0+zierfBheEvJ5wwc2kwCBxVR/AhFsGY
	j9QnLwnVzX18WOlFIFcnk0ltkayt3+GyScv32OkHxcMRkNsXeej4djV0oPC9v/Bkwk0QAXdpysa
	06wmE=
X-Received: by 2002:a05:620a:444a:b0:8cd:78b6:e261 with SMTP id af79cd13be357-8d01c5f28eemr140648185a.2.1774604236007;
        Fri, 27 Mar 2026 02:37:16 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:8cd:78b6:e261 with SMTP id af79cd13be357-8d01c5f28eemr140645785a.2.1774604235596;
        Fri, 27 Mar 2026 02:37:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6048508sm2026149a12.13.2026.03.27.02.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:37:14 -0700 (PDT)
Message-ID: <cde5bcb8-685e-4e1d-ac61-9a216e8ab040@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:37:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: lemans-evk: enable UART0 for robot
 expansion board
To: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-2-canfeng.zhuang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327083101.1343613-2-canfeng.zhuang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dCy2v07KTbsnc_l6h_PH1YGhGw3AHIdL
X-Proofpoint-ORIG-GUID: dCy2v07KTbsnc_l6h_PH1YGhGw3AHIdL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MCBTYWx0ZWRfX9UUGsnV4+xO7
 Fm+ps1Qd/ch2/bE8eJoMZ9TeLGLo1kybbDXdi7G1uDvJJf0vdibuYScTB2Lpfa+vQBpZDLbwtPD
 nc/yxObwDWXF+Hvm86/k1vnAYyKuM8cMfsJe5M2K+akdkat0ze48R0zxnIvOKdEr41WjftuyzkI
 pcVULpD14Ci/eIWTyGqX3ggKTU8lcNTR/9KtBjhg9i1X1nyccBUqqd7BVLZEJ/Rbgoz220FfWOq
 GEGiofZbtcy/WCoHjm9aeTt31TtiLK/Pg8e8SlPnNcm72UqslgjhxiCfwaodq6qWo/CmRtX6Na0
 4zvQ6Y+hKn250eZwWy1978OfBGAaLsB+HbQAeyx5Mt8ezosEcEVX9lnbIDJw8scjntvB6zMhXMU
 N/gL0FSLrmo81XjN93/KcPgmU6HuUnPAdzkkWuNuTJKyupS36Fbfoy1qheFiwifihl30sk6RWZ6
 Eu6B6B7F0xuF9hyM2zg==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c64fcd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GeFP3kUyQ-hAHLItCtwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100236-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4594F341DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 9:31 AM, Canfeng Zhuang wrote:
> The lemans-evk mezzanine connector supports a robot expansion board that
> requires UART0, which is currently disabled. This prevents the expansion
> board from exchanging data and control commands.
> 
> Enable UART0 and assign the serial2 alias to provide stable device
> enumeration for the expansion board.
> 
> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

