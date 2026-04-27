Return-Path: <linux-arm-msm+bounces-104733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGbpCT9d72npAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:57:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E494472F7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FF313001040
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814063BD629;
	Mon, 27 Apr 2026 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDr3RaOW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkL/dX6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA433BC687
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294570; cv=none; b=ggDxBKDNCZacnuW1wFHnDFs0B2KDNrH+UmP3G+owuoaDi8tYtCnN89noaAiXqmn0WST/LaD9SDafZeQUX800PknxxNou0QQ1lU6h9vrEt0QKUmkwIVDzixmL5OXOgnaDyjaUS/WeV5BvD86sq2Ghc3kTsg/J//8XUm7sJ6jVvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294570; c=relaxed/simple;
	bh=vszQpynj8bogXIjt53OMrmpaaC7oK9NQMvMAHad9rc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6gAf2NKpg4tbBX0g6C+BAe72FpRQ4f82UhipKRJ0Ii4QKY8Pq/7vg7h5KzuoEzploOwLCu8+xxWxc+bbbtbY1mUq1fSjRdz1XQ5iY/gnuS8v0FVu4IdxEzTv80VnWk4EApptbx4BNWU9eyMENcjaJ7Sy491NM7ycRV4AnVYEJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDr3RaOW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkL/dX6Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYPlV429017
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BV7iu4QdBUebS566h1y5fdtOV7ddcUCBmPDbhAJ2XCE=; b=QDr3RaOWeS85NudY
	Qh/kAK98ECAgglsTiJLz2YSus1Yo7Mdi9jaHyfBxB/gzMAeE3ufVpgzS/8zv0pwQ
	PTkLGzQtA5aP5D+OOD4ZS53OrGdIjxznBVbEmrQ+DyEW/tkajLrLS35xhnaX6hbe
	tYAyFjGHREEL8AFj1v5W5Bp3Aon6xFRQEnHcpYHMC5jxrjZA+Rv2ZoKREOq0dC+F
	wK3ZE4kKelOT+GVAHL0BtEJYUc9KwvjSKWRvUoxA8MvmtNbkIJpwPKW/G/UwTOFd
	cO/OL8m5p5UYmNcAA9J+IDGtCOJbk8rW/P/3jTUCBJYWqZ/rKO6iuINYmxCVq+dx
	ZOCixg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x30205-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:56:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f1b94ac9dso19662101cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294567; x=1777899367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BV7iu4QdBUebS566h1y5fdtOV7ddcUCBmPDbhAJ2XCE=;
        b=PkL/dX6Q+i4fZlZtnoZ6LigofsobTgWJJrEf1Z0e6h6Ld5vNKeugX40GJabSxotRME
         7SCbzWMoQgVAsmWxIdBmi6rODfrfigPgMXjt6s+6tXxZ7Ay+VxJOqgzY+X0daA9bFD+l
         smQXCXcH+FCmJHNW5ZJmmo1sUcreTjwwSvI4lN/kc5TFTeyhMH7z4w8XISIYjzz5+dHA
         9W9BSELVC6TlrPXZobMfmyaTKiptctkeC9We1aqUI7x/drwkv5A82x8KMoeLxwWTcUSO
         cRDy5AzL66XWDK8+679vMqRHAh9JsK6e+QowKRqiRXFU35A5sqTQtdNh8WnvwqvuPjMC
         WJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294567; x=1777899367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV7iu4QdBUebS566h1y5fdtOV7ddcUCBmPDbhAJ2XCE=;
        b=o6yT3Rk+mRlU8/qIt04wUlnNMIpF5HaY5hiWHrzZv+u9Ifppgb5bCi46fQRkGuEloS
         17odc0QlskuZIalSQdJ2GhgpUbG716sZQMcpVAp6KRI/8HOUf/F9mXYlZAUe1oO7JMUf
         gQS6PEgFSk+k1CqKr1iX0JS96WVVmsssNmHCsOEQGYWczwmGaOYqGPa2hDW4tFJVcASj
         CZSUywWhn6vCAX6HciuhdbmwS85PZrocFyY1Y5swxrABJeyM/5QBHABiD7XQ8UGgxL+5
         SEfCXmfAJy2eiyfTM/my+ylfstExLMrW+TI+lYjBpARYmfHyM7dsb2VDYUUx7POJJL9Q
         WCTw==
X-Forwarded-Encrypted: i=1; AFNElJ9eMPL80Dr+Rv4muDWfnGaiGYhGkdzmRUfh1dNQTXuGFqA8/rqWEn5sKokiJy62oHZHLljRZg1Lz9pwwXig@vger.kernel.org
X-Gm-Message-State: AOJu0YyXLiz2E3G1uvreJMUGW2zSM2rUii3e/uN4vmKIiY+xPYxJ4NuD
	ATsoCE1N3A5JgwvfxPCrIPgmNXWAfKgd4IOxr/EjAPSd4f8OUKaKAdKjvDrlEtmJomuYkdgcyyc
	rE8aN/cj52gjA4BqUb3eNkZX0+GC1TvSV4Ft4mdDYIsItlSZ86J3iCHdOHvWMIMWLxSs4
X-Gm-Gg: AeBDieva/Ki/sMRL7ueb15DBm1tm3w700+l3Ijx2im0KKxZ4LTmVyt8M8b7I3l31Nxu
	wV+k2yG2APcrPw+u/P3+qmxZj0nyGVIdTwriiMmnHeo7Y9isx26oLOwmckG/b29zVc9tOXzxqpU
	iVEURJvNjqk47Kvc2cQkZDsbgCazrAMMxxvCAAkKjyYjnr8JwAyF/MPaZ0h5EA2DnS7kwvI2GJh
	qJ9JgfSpCmBsUQnhJICSQvjzj4HC3gB6ZwjUsmYXWdX796qpr2VXPRTa+iKzzsPsyoI2tzEhMnY
	2XJyefgAortrfo0uPZhJN1/H9d4pA0GeLKV4R8yBFIjKa0NljDA/dyUrnleamJgi6N4jSqdU2xZ
	6ZmYfL4jzvni/RoYBPTyzDJID672wDLZwSXAvTc+LS+KdE2C++dbclhkdct5hL7xN69sFAjvXUp
	CuBYKA/pBimbevbA==
X-Received: by 2002:a05:622a:1918:b0:50f:a53b:9cf with SMTP id d75a77b69052e-50fa53b0c53mr284503731cf.1.1777294567182;
        Mon, 27 Apr 2026 05:56:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1918:b0:50f:a53b:9cf with SMTP id d75a77b69052e-50fa53b0c53mr284503401cf.1.1777294566746;
        Mon, 27 Apr 2026 05:56:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe874sm6386349a12.6.2026.04.27.05.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:56:04 -0700 (PDT)
Message-ID: <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:56:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNyBTYWx0ZWRfX5WEAnkwoRUSP
 mpnfa5W7BfDNZBZEM0ruD2JCECKeezvpUK0pIbwiWV+1mQhRjfsqjUvJz4IoPcJc5Sokt/+9aQs
 54aYTxY3alEg9Pxx9N/CfRMZghuH6+rk2qHYX/LAQbBrnIKaFcPcyEZ0ku8S0XnyzLwcqTE9SoT
 /HkPwDrlw4LtRHLDvOUc6Z2jNrSyn8Mm+FK0N7EYVgzUQPwyzyRNy+YtDr08jy/Q4fZTm+UhVg3
 TZ1fiOj+JMVaNJ3zks4g6k8N0C7YmSDbhCHGmA+1J1llE7OulzWW1FBIUdIjcYFK+4+VHW6UYNQ
 OzBIARUJqkwhN+DDULvMiI7ME4yW+sT3HFBSIGLdyNAgw0dgZSnX3RgWPTw31jyXIufb8D4L5su
 IPZ2e86cN1E624ud+sTqEu5HFnYDHMwAgZFMSW6cWQIw/bd1ZykwJQbgx9A/2s0dCA32TfsibWk
 QuWzoFK0zTKzXFsvmyQ==
X-Proofpoint-ORIG-GUID: ZP9ZxUL-oMaQn5vhFAnoy6VKjY1WjAlQ
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef5ce7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KpaCYs1BneEYRrX5G8AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ZP9ZxUL-oMaQn5vhFAnoy6VKjY1WjAlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270137
X-Rspamd-Queue-Id: 3E494472F7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104733-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 2:43 PM, Loic Poulain wrote:
> Add the uapi header camss-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]


> +/**
> + * struct camss_params_wb_gain - White Balance gains
> + *
> + * @header:   generic block header; @header.type = CAMSS_PARAMS_WB_GAIN
> + * @g_gain:   green channel gain (15uQ10)
> + * @b_gain:   blue channel gain (15uQ10)
> + * @r_gain:   red channel gain (15uQ10)
> + */
> +struct camss_params_wb_gain {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 g_gain;
> +	__u16 b_gain;
> +	__u16 r_gain;
> +	__u16 _pad;
> +} __attribute__((aligned(8)));

Should this be __le for all of the related types?

Konrad

