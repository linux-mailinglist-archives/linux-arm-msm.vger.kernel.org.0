Return-Path: <linux-arm-msm+bounces-97486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LMrEhMJtGlDgAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:54:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E178F2834BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48F18301A9C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5400939020A;
	Fri, 13 Mar 2026 12:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjXFX2Dx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgE580FD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A6037F745
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406480; cv=none; b=uFDEy2XapUM8esfo9x34UcxfnT2q72IXWaNf36tMgvlUUlhmPycrFpGm1AuN9jorexsuh/L87gAdF5rCtfKT/1JoOmJtSYdJ+oqITPClcNoiaDCX6S53LbwSaBlkCNaDLakLX+5WIY6X/90r3cFo0tRq/SSpWOLQXYQlIWChtg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406480; c=relaxed/simple;
	bh=jQS5hWOdYB418CAw1PuBt8maqGMZdsbdkaYVXTrqH8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndTcoMpvw6+f1bYbbTFljGccvt/e6OacQ8g2qIoVz3ksbB3QOIas/IFVwulOLMVWGZ6MFTq9YHZjldCok2JwGX8Nng58L0qxWMkgsVgNlXFpE05RwIaIFowHH0yiC0DXn6eFRpzyRR/HzGkfiALewROWY8HbMOkAJeUaEAA8IJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjXFX2Dx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgE580FD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B6xw3906313
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GrWQ1YC99XSo/kzP4swRrD7onPPXsUnNzZTfAflWHlI=; b=NjXFX2DxghTuYEVc
	gkLO9DchOlg6Ct64GA/xzNCBdaCoqS5x5lb8bzKR6d6gJkCDoUtNNA8+CDYKWkZe
	J6ROl4bWcC1hOPZY2+FPRonOGLycVeRCPZlV2xMXPYy0dFsVcCmPI2gzDx/5KY6b
	uBL+cYO2rprRA8gSl2kjlMEdHRNb03i3yV4YoitdXaXyWD1wm2QTyl8SNoYM+Loy
	6/usSWLgOBLr6r5zpKhUbyZpo4EB3vGM1JnmfmTeU3XgzVEyTVzTxQP3SJDCqqdq
	QpHsJmMfNwGiszMJ9bAWxcUCdnvYx9V57LB5JZ4ZUqfTiooWovFhx6CAdAfqAoNg
	a3G4hg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs8pkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:54:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb39de5c54so117692885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773406477; x=1774011277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrWQ1YC99XSo/kzP4swRrD7onPPXsUnNzZTfAflWHlI=;
        b=YgE580FDHF0xVVmM2L58r2beHUuXjy3mt6SvZjT0rzfV8ex2CnPx7cRzlLIthKTo/v
         MjOBXvXWpvZ2GKfOd1uhYCaDCt7LMmJSyi7syYMQ3tSvFzw8W3y4EZdkOFo2yHCSi7Nc
         W6+GpTASnCeAwanWNeO2DvWsRc4INGAdEOqCPLTdYNpDsczJEDblnKla3a9irlrIVbS5
         0P5pA3uVZeFoXFInATCr5R0JMTNV2pgpg6BYGoiXYht61sK0g7lv1oNQ+jhDbeaXT3kH
         MUBgnprFCfGleOoodP7XexEw4WUYzmXPpYEhqINrzic8OiKNY577hjABUJsb/OvyeLV9
         IUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406477; x=1774011277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrWQ1YC99XSo/kzP4swRrD7onPPXsUnNzZTfAflWHlI=;
        b=MBav1iKo+AoAfBpwDjS6SpXeLjHwrv0gDwPXMQyvtH/vuKP1ZZx3G4Q/yXTvEianO0
         JprxlBJQ6VMkehMIXu7lGbUGdQ/ZbD/9gddB/Jr71qZE1n/ptDPrEbMDnnVmkRAv1icp
         j5zdkgR1Zndzt9C6Z65qQOO64F/Cmga6C9LMANvTdmBTAEp0ZeZPKiOBtVrbauLL665w
         YvHj6Fps3fFmCzW4GHAQp6GgefJqGQX75SRfHvDXojEEbPyJiXE2ew0dnaKUhzbTM3Bn
         7S/Kv3W7p9Ik4cy6P+rGH1LLV4J5oQ0F+r8gVbgQH1pVtRCeaxI6XHWwAazEr+Vl3Xv6
         DCCQ==
X-Gm-Message-State: AOJu0YyMq7Yl21+jPYOhHW/eBAYSS84RR9SidL58mKKc9JiXdasjwXXr
	PwcE/NlzhsRh0P8LNioMTjsG6wJP3rFaq8sEzrFIkBq6KfCZ7LBEbJeqEZ01HrZdqOV/a5ceBpY
	4Oa5F5b5/AI1LJmwOjnVm09B6VPVmZS1jUYegiabTtkXBhGyx2eT0/11F00NyRjCyzhUq
X-Gm-Gg: ATEYQzygjYaFktxywnsgDqVDPdvvJVQ8ARI9t9/YvF6Y+HHi8rtQoCXb64QHp5jX+9Q
	pmumpwR0XUbt3aj/XLxjuKb5FgJbTqcPcRRAmGpeTnoBF1UMdlVGVnbn1qhWkusf7I9Fv84Ftjq
	sqJN14JXUedRztEto6w8TALv1+LJ5FD3e+x5P0OpRuNdeT6N3ZKtbLMjFRD69gxTsNVQU8rzGjM
	j7dfkNUItYQctuaj5DjbSljmMskuybw1QxCQ/aYzZwpMyzwRC0YAkQ3nQdMM4pBqshVw/vVFZhh
	U7VG28HW9VQtjj+NP/+8BKe9X8zzpS0PNhHVYdjc1SfOkdSxc0ljK1/T25Ce+uRo3gDUqwRWzPD
	O72aSCeFdsA5At8Iz7d002LInEScbkle8yoWc4493z51nKw5L6+iRrgTS1ui+UJ+TZOy4E3kATt
	g6Gz8=
X-Received: by 2002:a05:620a:29d4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cdb5a7e0f1mr314017285a.3.1773406477453;
        Fri, 13 Mar 2026 05:54:37 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cdb5a7e0f1mr314014185a.3.1773406476882;
        Fri, 13 Mar 2026 05:54:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6639fe6dc9csm794503a12.17.2026.03.13.05.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:54:35 -0700 (PDT)
Message-ID: <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:54:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _1kqyugdvH7hudgZW10yQSBvHzEwCAGR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMiBTYWx0ZWRfX7g93lIsJGbO5
 i6KUKgW2LQY8DTcPsLLjesGSlF11s2O4WeyjHlMHQXfpvc0v+zPl+Bpf995/Qe4LEGDrbIhBTpJ
 n3MgzItK15a8DI0g6TPgaQ5+SqDmP/+hpGxHl37FLTaZ8aH6vrWXO072jNSAfURIS8BxxiGQ0lo
 iJKMS9NB3vMJluCoIgC4CDq+90B8oPTy+JRv/0q7XCJE7/ZpeKtwaPzBvaoZJWticCL1qxIwV2X
 pogMryzAQODX6eaINHW+UmnuM77ue3FlZpeqUvRoDI5QBn8VjQU+NW27Ynae1Hbi37H/GnlNDgq
 mErsXErhZVvQnd6Fp0M3b8H8NocZfmgBJlMQp/UDCMbi41bNpCZSzwVL7QgUl8Bk+ks5dIT9bwQ
 v1DXYshp/JdiL3sDTfyh95PyIHbh3y9Z253KUoYBkPQBlHjXqdrav6hPh+2PMPUBdOrsuwlw2ZE
 Ql/kPuFe+vvUa+QS5Ug==
X-Proofpoint-GUID: _1kqyugdvH7hudgZW10yQSBvHzEwCAGR
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b4090e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V7fxQ59pePFiGF_lOj8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97486-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: E178F2834BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +static const char *const Led00_groups[] = {

odd uppercase

> +	"gpio23",
> +};
> +
> +static const char *const led01_groups[] = {
> +	"gpio39",
> +};
> +
> +static const char *const led02_groups[] = {
> +	"gpio6",
> +};

What do these 'ledN[012]' functions represent? Are they muxes for
getting activity/status signals for eth/wlan ports?

Konrad

