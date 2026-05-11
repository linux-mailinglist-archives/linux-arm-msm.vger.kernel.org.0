Return-Path: <linux-arm-msm+bounces-106876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ALxKkGoAWrlhQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:58:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9090F50B723
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CEA9300B5BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252B23C456F;
	Mon, 11 May 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AG85DNzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnqj+RZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB87C3BED16
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493496; cv=none; b=OO2T+RsUhNBH4Dm8DvbaxXppuG8BD45B31BZOfa7oV+Uz7KhITx0ynB8sb1QSZzDHr/iFNEekfkkKw+5PhP0B1SYigRl4PLHffSU4MGa8bm2IHRFAG8orizlkSYwaZM2OyyKb0H3lj4Cdv34gpUzwi6SdVXjhGgQnLKFgUJyMNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493496; c=relaxed/simple;
	bh=7GutQd0hEer4bg66j6HNdj3RnmvU5iow0kHbDL9cf/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gv/MjeJCuPjZ7Ik/qahfPFDNPq5Tv9b4iooem5Akp34BvsJpE9SgCWT//Ec3KY6SRH/kPQHc+29mS3aYzX2kEtmhLBuYG9Xjwp2ulegUV0vmhy9ADerozi0hSFZB1u3ulpd5JFG0hpM3bfTD/WqK0wUAFIfcKJwxaX4VrXSFJ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AG85DNzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnqj+RZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7CvXV682408
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=; b=AG85DNzf1OvYu/Xz
	qNT4MZs43mnEuVdTgVcpk84JGph9P/5IrY8IW3ivBpxlNgpVtxLBNvB+uBipq+sI
	iLSiYx1HYr4PN9wqNANjVyfCkiecE4u3QAkOKeCam9Zaas4LBRsH/0O0kxcPwBnn
	Oo55na+6o5ChNaqTgnbF7nQ1B1nkeJE2CVUgWYHFuCiZk9brgHZ5F9njR9MfKkhO
	R4ECNEE0Nt3QvLtSOqcGejyE5+/ORAn12kwgdVL+oPAJWgMR2cM0mR+bpUjKv5w+
	jS+DdzgYutH7ZdwSSnKkOnHwNsluD2avj4Dgcr6BoaFX3DWZG2yPo+sfORxc2qd1
	4WXJlg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wpedg1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:58:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5751831fe6dso355387e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778493492; x=1779098292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=;
        b=Xnqj+RZnzCaE5xW0RVFZ5qIZ2cRXNGaXPYq+jxVo8QARsFMvXwW71X2g6sDdWGnFWO
         1/Y5GTtge2dkF7JvtbrUnHWO9w18aGUbPq0jWpdlY2/ZnFUlSV9QJ2YQ+NnvcM5hU1JV
         B8vKmmNDh6JisCLRGTizyeBXuJ5s30MB6HVBYCLp0Wgj3qneMyd8YbaCT+qTZF/HU68t
         9AHFrSAmZBVS279QogsnOPu+yU1PjG1MzNZTbyumU/+4bpIYmjJXNOyVaAmNC3jTaJzK
         UE9B9JBdxLTyMJtHbSnT6QUly/+pFowZmfxtQBBjPQKiwPWYBz1ymuiMSsEaE8KjwzVZ
         ckpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493492; x=1779098292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=;
        b=bDjOM1YU8Ty4nZk/Ub2Dfwjv77dtPiAf7pUcM3T031xOInBpGoNB1rNwaZ3IAodcnf
         MqxYcMrQ2j0I5NSLhl/OaaVA+AJ/DKH0m3cUmQKgcXZ07jp27uzkphgkupkXsEWG8Pbs
         puf2l5j3MZtzMzyQyE4ctNeI873WnH9YwMTN28p7YQ2Hdy3vhUx4aitV3PcXbbs2lOs4
         gBZYeSzd6iQDx+x+2IbUt6rSgqcX/EDOSXNh3xmWh8VP0BFT+YMrm9lRNq4eVgsqlASc
         IDAgM9R9hIjAEXGB/3CcaONFUuQYh5KB5a8G8Ya8czFDO1wAPAIukTDUY3J//X3dznu/
         tyyg==
X-Gm-Message-State: AOJu0YxsydoHxPwmfxNUN1RTdTfQJrlnDDRADWiCsqyUWj0XPWU8Xo6K
	8fLH2gGIu6zeREg/R6GJ+0ZzrXRD+1ScuYs2Ru7yk6beFEi2YyYEc/DXaufUy43oxJW1pmsd8AP
	i6jeQOABw3wSy6X33mI9lx3/ny1WYU1+pt8L2jTGGvoI5h1dPK6g4u9UnMLRK+c5PGQL/
X-Gm-Gg: Acq92OGTT9vPA+dcLM0yb7aIxpF+GpvL9hRNmu5DXPyVjK3Sr4LhvISicBN/BOIIqww
	ZcoVY2M1ENgsNeniSExdCvKF28R64QPMpd7/y20vNPLwdtueusqeQhXTn0MOqqLALnPZuAJFoUk
	gHhm1wpdRrzG1q3JUZ1+xJrouEU7vsO6kWF3trRygb/RpRHjqNo1MJeB4o2NV+SJLUatqFabqD5
	DggBMFRlJzDxNibCZRPOQQPY+g7Lj99Um5afYP8Mm4nrpQO8UXnVex7zYUuC5+J+P4ru52j/g6O
	Q1Du1KBZRKIublbe+BrHWDGFLJGAPvh5lObNsmtvN4plX3Xsw8AzWbaeZYjx7AJ/byrhPS0oThU
	ysCVYKu2Cigbmamveg4LHcAZdOn/mZmQ01tKsMq22Bm53h0RgSH6kzErCcMkzuzcz1Bqt3CRj5F
	5n4JM=
X-Received: by 2002:a05:6122:510d:10b0:575:a13e:b33f with SMTP id 71dfb90a1353d-575a13eb799mr762078e0c.1.1778493492254;
        Mon, 11 May 2026 02:58:12 -0700 (PDT)
X-Received: by 2002:a05:6122:510d:10b0:575:a13e:b33f with SMTP id 71dfb90a1353d-575a13eb799mr762057e0c.1.1778493491857;
        Mon, 11 May 2026 02:58:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm468593866b.28.2026.05.11.02.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:58:11 -0700 (PDT)
Message-ID: <774aab58-0825-4acf-99db-dd88df0366a2@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iWz61svtxUD3zVdqz-lDugJWHQJHNtNT
X-Proofpoint-ORIG-GUID: iWz61svtxUD3zVdqz-lDugJWHQJHNtNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwOSBTYWx0ZWRfX7pAwmoPaM1eT
 g5c3V4hQvHl0UR4ELsbSP/d4W8GuK2YIguMuoqkTSTnIt/Te8/G1m7xsIygKi/pWLgvHWFltDSE
 wZxy5h/1Yv/8Myv4PGQx9NIUnxUsb9v8TRDeh75UIjTq95OC+Bi4aP2BP3blfoelTY/G8NH/Dav
 uQPlaPABhHUGMwjsYHWDt1tGKQCZhpbr0XsG/FBdQ/7ubDfSaFdBCT5eYP9+wbiFMtm5sBqvx0I
 u1lsHbQXi512jPp+n6/6Q1tIu4uDb8hjuIrxdIkDWYH2prg402X+Lv2NbSyXOz1PYtyRh/1YDhE
 swlhf73FSviWPlB+baXzgT3aMygsNjzG7ovLjOd6kfgeyOhEHdEQyMkNuYRmmkeEY4LGiAI+Boy
 gv3flwzkucGMiJs4UubzErZoPZ7GdUyNsEOyn7+udV56DmQsQxP5Mo3r563tvFcw0FNwIbfPhSK
 nJ7NmyIcT4V5f6UpV/A==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a01a835 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZkPnaNv3TD41VdVxMYYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110109
X-Rspamd-Queue-Id: 9090F50B723
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106876-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 1:40 PM, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on hamoa.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

