Return-Path: <linux-arm-msm+bounces-107901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKEfHNUdB2rnrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:21:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6704F5505F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADD3E31748AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7B838B7A2;
	Fri, 15 May 2026 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9kSmNEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrSkcPny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D503D25C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847507; cv=none; b=rcRgrRgKvjwfTs7N8Vynz2gKNBTynJwyKbJaipryFTjVXgggQC9oN7LnoaQNmxdOEXmaIWJi4d3frd5piQbSrJr7uzbayNI+CAwLHJZA8TsiO/Pbu7ToKl5EInNFVdds5LyIL92qzB7CZRl8C2cG6d5YPxT27LeqxhbiwmxJcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847507; c=relaxed/simple;
	bh=Y92+NnwPShhzJLFZjXBc2z1/q5TAn4x/wrrX1Jcu5MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DO/Lp7vCb2+PfFETI9p7UCaNqs0Bdd5LcOjIbfmcVcG9OIoqNnu9TsNTP9M/iQ/l7frSo7SGdxr5Zmlen5Ww1ldqmo1agW5IWE+sC0yH7LBgwrb/tfIyZjjjIRIDxCYdvrPAGvUIdwdje0ykiEYeLzRhnC+F/jOSvTC3rBjZrXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9kSmNEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrSkcPny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAx6YZ4008388
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=; b=d9kSmNEIqnh+MK2b
	YJSUbbcESvpM/dgfpOAgRFml+eYXTlYwIhudBwiT9zeJU93fAkrHa0qi2m8WKuhS
	e1zFWYXUSRt+87o5FgLxzBK0XvRuMqJzd2mwuX5iW2C4BIh02Ev3hOiL+kjbWcj9
	Bkun37qMYv4nPn72PvkZ7x/8ZJf0AA+au7s5BI8biFZYjX+6VLbMAcYsLBkKy4Pm
	qmjvwpsxHc4QG0f8H7/lkm7F21Evh4z6H233gkBOLmSBO+ViOUuvAa0252OtfNAW
	WiOvUOngnbdgOoP740Pol/oEXTCvQlu1ulh0DPTqhDHXNnhYxcPZVJ3wIcXYWGJH
	UYAWLg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su76q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:18:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6337c4cd5e7so370667137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847504; x=1779452304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=;
        b=XrSkcPnyQIAVH3K7lYrhjPpbstcXOawOF4Wz06yZMksiUACMKDIPXDZfcJponIQ0Y4
         BHyBzUEsQ0J+sa5hqwJDq4t4SEiVpJc1VbFbyQXDEEHy7nmOYwTukH4MC9jtN2K1HbiN
         1CBlcJn8xFnzNv+G5lKS899YrxoC0ZTIW1LRUFVoT1Rg9V/dASB3EQXUIfkLfd1L52MO
         VEXQP6wbduoKbRYQsF+pogmnQjDNNqQjACEgAh2I2da+pqX2j1egX7ZgPiryrYrTHCN+
         FB0ugOzacM24XGB7RyQtCY2I2LLMUFScRDgAsGlNZyy7w9S+3YViKIji4LGLFmlkgD+Y
         HBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847504; x=1779452304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=;
        b=tKJARULrbkGhqkH+xKemJcbcUKGD3YCJI6KhYmRvGmTu3je/UIjIUF3xlSFiUW+mBj
         PnM0KuGHfzIs2BIOsj/gdCSuHhy30IulrhuEck8CSCaE0esBOeLNfICsMPpdc8yLHEif
         KA4bJnDGB7mKM94azruk2X8Y2DtDwtHfwWcufCTor5aT/9KJcVNQ2Jo09aSXTZ/86Fte
         cRUGXgpwqYkCY/vbgiYjGWRM7IA6dwiDlAWwdu6PxILcDjL4IpTm/8UntwkHjVOm2tXO
         ZZzWFNyWu1q9MmvxOOY6XejQtrUkGbaAMLG8i5TX7nYTjcbFgempdotIAlujYl5xy5TA
         QRJQ==
X-Gm-Message-State: AOJu0YyaMWR9dJXB65cEfk5jmkDcXWA/GR3Jag+aVr4/sbfMv2Gox3NQ
	WQjGnD8IXyiEj8wnAVDVaxG2UZ7V81k8IQM+lklvqsLAye9DjczVjp/lVJphBceH6HMSlWDkdYA
	s7GeepnAe5eErymy/x+9hoD0XXgn1wHxo/zCIqlLRHEcEEYzvRPa9zp5le1MEYdUVkckx
X-Gm-Gg: Acq92OGyXTOarhNsz1nwfAEUHZV3Qhsvh8QSgF2yLZBZ2qiq1tqEOanU2+iukpoNnPL
	feeN9m9+MhMOju/bOUQGGolT4oAAJaHJ5tkojY170HDn+qAVhSjNE7Ysv2lDnWSP8hanGoFLP/Q
	vjNp8TeqEP1Y+U7kzBam7idUIjAD/0zJ8W69Bre3iJT/D66LrDzX9CiYwNXc6C8O+uPQtfjoaJX
	0YWDuDrYoQ5G4KOU3awZk9gsZ2cBDML12O0cRN0IbY/B/b3s5cBxQNd89BAzt+UPrt2avvraFpQ
	gwf1C6WbFTXAGtGUs6dt6bWa+bmH7fOe90sxtwwqXkfJyhcXraiAOW+lsNYKODw2znwI/MIzrq6
	2QaSJ6VMDt0/pDL6+EMmRhhTojbcxlGBRzTo/4W8Q/SId1ypsLtPxO5Bn3ajTpdUoBQjTBhpgGS
	3BMz8=
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr690361137.2.1778847504232;
        Fri, 15 May 2026 05:18:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr690344137.2.1778847503791;
        Fri, 15 May 2026 05:18:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ec6548sm219253466b.62.2026.05.15.05.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:18:22 -0700 (PDT)
Message-ID: <f7800c43-011d-4133-8717-9134f5ed2c15@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:18:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sK9YOdvT8oyyI5aLI_6vdjMGfD8LzRJv
X-Proofpoint-GUID: sK9YOdvT8oyyI5aLI_6vdjMGfD8LzRJv
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a070f10 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7yNcMj-pRB2AcvHbL8oA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNCBTYWx0ZWRfX02O3NKYr/2kc
 he0NMwzKp6hmms9JzfVyGNMiWIHFFjFz/WHPyH0UnhJSWkae6js8lqjs30lTICtJ3vVbg5XRoEI
 X8lPoXkZTLXDArK7xfqKT/YiqeeQu40mvkIaVaqyem3/Irli03iAsWxdY4ENIBwy71N6nY90GSW
 XHHxAuVwIsS7zcuck+ZC1OBfUrJvF7LOPwd4j8JjZwFcIfiEVQ/O+WBpnXd3ZsQjSwuF4Eti4H8
 g2leuevuPFhBEuAN/xWWIsxZWQqNcwo1XtHK/dBqb8+XG9CN7+JAr5rfsGfy9l76WqfBEh+mL36
 DtDSq5rDNiQGIY+N0Qu6lFFTPQNXuBTZzLjRDQu4o5gqMFlGFr/FS6rk2AAphiL+fH0jItKQXgB
 DR7bR74WDrIrKcMIjJR2hxbm4d6S6r72I3HNYMMDZc6nxBNn9SSUJZmuONiVYrpGvyGWuoV+l9Y
 pz0ecDDDIGtgR9qI7Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150124
X-Rspamd-Queue-Id: 6704F5505F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-107901-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
> Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
> firmware in the DT for now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

