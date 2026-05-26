Return-Path: <linux-arm-msm+bounces-109754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNVtIFRgFWp7UgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:56:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ABE5D2CF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D40453024AB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130613CF694;
	Tue, 26 May 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YV7HYVYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOy8k96w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D9A3CEBA6
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785735; cv=none; b=G7+Xvaz2WpjaIiognMFBUjs8PKVtlMJMk1tKdNsKQsREDrODNnIaYfO6gWHuZ1w/9nFdFfsM51195TNiL89OhbtVLlnHvN1uXBn9Dww39NahlT+F+l3C9ExAGhuUzJ93JoH6/vC1tKKzRK3U8yRYjywHN2bJ83KFh2HEP+AxQyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785735; c=relaxed/simple;
	bh=f5KtYKaGJIxJIH6az8ZfzoSlLeMtkQY1lpV+rUwL+KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPxfRCkNcnqtmI1gvDfdlA/+lGGd6Sq8zBAB+YoEUm99sEPQh6osBqhFmJL5aQWcRU6dRI8pucr8dJIPAD5tWSdO46RGcqNVEvTVIx6Sq3jXUVA5XkU5ApMkmGrEE4MZ7GE3F8ZrG3122gA2hy6Xg3zGuFaByJFtkG5qt1MPnrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YV7HYVYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOy8k96w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q60cBV1763299
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lW+9suIyqVCiJGP9No19FKzkPfU8OlRbEUkWKfC9f+4=; b=YV7HYVYNNxtmRNDt
	fqLX21zOLn9xr6KdWdFRx7xpanAs3FfIPeMi8WBSnozd67JKodgAIPDUZ5LOqfJQ
	1qlBS5MN+esEN1hguBnApfVoxbLIG2YpuzLkr8/G6mFB3Or1lwaQw6BVXlsTwhUQ
	B7ti7z7zj+wx4heoDd+wmtr3x3dP10ozxXCmRO8WS9YGtB2zbi/MKQrFOk/bxtMs
	wmqoaOFMUFXx5PLmTUG9Fs2NZx66HM5oVHOmPl4L26QYdRMlDdR0t8RP2Bhf2Xc5
	3PEBgYohLB4ItwmG18UKouY9MOhv0IjtKxEAmHooCn2UY+Vcag//c9RXLN3tblD/
	TG5cxw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vggpmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:55:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51650041428so52038351cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 01:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779785733; x=1780390533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lW+9suIyqVCiJGP9No19FKzkPfU8OlRbEUkWKfC9f+4=;
        b=kOy8k96wAYKMw1oN78aAhVP8QRYK6ICVv/KydJcvFs2PMnxSWFN2EiLery05mqqDyu
         mV8CnkqzQFF6g928HcU2EIgRxFCHyTpXLid+bz3WEkn/1gxOfteBBmiejoRXK72lo3E4
         OrD2HDCdIpqCxNKtIhQwvjNbCiHucCuNZjHN7cv7yI4hC9bttwgs+OKQfx7yTNR91qfg
         2dp+qoK9PAJzjt/hxcTLdPNguwIw2OnUvmyV4qtTfpC53JfdQck3cP7denSeZVvmp8EG
         NWaj7b64GZZVLp9cAliSeHf/7Idb2hr4YfMsMYAhJosmCvYK6cRCSpwKKCMhZ0CkdnxN
         vBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785733; x=1780390533;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lW+9suIyqVCiJGP9No19FKzkPfU8OlRbEUkWKfC9f+4=;
        b=O2j2Tpc+VYRNyHMNefp7q0TMYhpP4GJYbQCwaIPb7TunEj/5WkckB0684tLcw40snA
         x8Tr87T+P4MFG5kst3U8YtuWvMQWVWZoY8/yNBWNKvzL+9WF1p+Q4k9ys6bvIIHw8qmR
         s3mzCEIlCvlX4MbJ9A7piiCoWhJny4r0ToSSh4WLD6pPrso3yWwNbpgTbhKsLA/XrqJ0
         Aq7BsU5fq9nWHwCN3qozP8kRA2e4alcRnyDo5ipnaD0C0BeCSP3kF1Vdut2AYEnRC8mH
         jdzzy03X0BURCC9Wy/7bqqRwCPJYOoLAw0fPAZu0TmDr5hWWr9qOPS7US7D07MlansMz
         DJLg==
X-Gm-Message-State: AOJu0YygD1hPckgMfzUeg7cwWikStZ0MjwiT35JDS7PfTSSFsitDZm95
	7lxotYHb0jGe6EucJUVHWTR7kqHIDmhYbUp1aSNB4E6J4n3HSVThIqH/clr6EfbBHhDkyGY6/0R
	qZHH0p+4PdoKV7Lz8+DINMKJ09ZP6Y6SfSPKGAU9fwm5iiQ3mATnLnOdMBlispY6iGona
X-Gm-Gg: Acq92OE3g0qQuUJoq+pIKJGSxHcMFd2bQupHsYZUGGpCzBMlU/wwSa/v3Mk5/jxYmdN
	iT1KaDOtMCDd6t2uouv47vICux1yKpY/wIA8WMfFYkF3LxNBpCobCdwRI6FfSaXpDv86cVTFk4j
	ElXJYh8T6FAqP4G8PzeKNLA8jHTa/Ify9Aws+dR08qjyKO5n/4SRgS2NHGyA1zMeREF9Dk0E9UL
	z9uBSiyue+GKdV/TMlEeAHDr5zxniqOtqJr3EillNV+LP/OngILMNzm+QybAcRbVb5CvJ6swOXI
	klq/GWviGbHausf8+Pdl0MWODmNx/gN27kh5noY1mbvmqcXWFdWqh7GQJoUYf4XV/pHN60VCvvs
	qkRy97B25NmDO2ZrwYnfIGO2bO57H85/D/XarxpdasSiSNw70cnqdqRpouq/0LnctGFpi1mJv9g
	QLykM6oOfk8WI6/VFnVp7jSmAhSEHuuEI4qsw4mrGg4LxLoswWc7Tf7BoMRfrejmfNFDiwIFnSx
	zgm7qYXZRm2HuYa
X-Received: by 2002:a05:622a:4e89:b0:516:d66e:7b1d with SMTP id d75a77b69052e-516d66ec014mr228482751cf.27.1779785732757;
        Tue, 26 May 2026 01:55:32 -0700 (PDT)
X-Received: by 2002:a05:622a:4e89:b0:516:d66e:7b1d with SMTP id d75a77b69052e-516d66ec014mr228482591cf.27.1779785732340;
        Tue, 26 May 2026 01:55:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d3f21sm478681466b.44.2026.05.26.01.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 01:55:31 -0700 (PDT)
Message-ID: <82a96d57-94fc-470a-b7eb-f0fde0c0dad6@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:55:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: input: hid-over-i2c: Add reset-gpios
 property
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
References: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
 <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a156005 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=DlE_u-NSBxGluEoo6gkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: oBzZ_gm_AnDY4I8gkPKc83AWPiLZaGgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3NyBTYWx0ZWRfX0Rvn6vU8K0W6
 7rg2kFc2SkisXiPecmL5yiyWdhlIINWPQ7jJ/EbJHzYNDhcB3UJrVHSaAHSOkvXP8LoaO9XeouL
 kBN8UYNg3rbXaR0f0VibNHorVGQxYcQ6+gStmUm1gBDWfy4yiwxCu0n5tCtMhGiNlD7OxEtPALI
 ivlIklNQtJMoM5iOnpR4oWb9ZF2buCRn9rF2Mbx3sUr7a79BvoEiECQVo9FIE2XK2Iurp954NBl
 CUDwuKuj6UHsCyFNrCQhq0xua/QlFVxl4m4zjprKfwtA0s9iNN/pyxrY9etwOb+DuIIw7lBYEv6
 obWZyF0oHCwZbThRebPq7IPhEWfCWpFcXEFWBwISIG5IWDl1iof2M015W3HYCigMvZD5Fxpa6Tm
 iqInGtULnjdNtcT8CrK06BC3GUQY9ai5Ye+v4x5R+5A/OKcUkJNCnnG2JZUOYF1OS7dogYIVl1M
 dnsYTmLwOIuOz12o90Q==
X-Proofpoint-GUID: oBzZ_gm_AnDY4I8gkPKc83AWPiLZaGgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109754-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28ABE5D2CF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 22-May-26 21:55, Pradyot Kumar Nayak wrote:
> Document reset-gpios property for devices that explicitly require
> the reset line to be de-asserted during power up.
> 
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/input/hid-over-i2c.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> index 138caad96a29..fe0ec4fce673 100644
> --- a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> @@ -50,6 +50,10 @@ properties:
>      description: Time required by the device after enabling its regulators
>        or powering it on, before it is ready for communication.
>  
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO line used to reset the device.
> +

For I2C HID devices which need a reset, we typically also
need reset timings, trying to do I2C transfers to the device directly
after the reset has been de-asserted typically will not work and
some touchscreen-model specific delay is necessary.

So far in the DT world this has been handled by touchscreen
vendor specific bindings:

Documentation/devicetree/bindings/input/elan,ekth6915.yaml
Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml

Which are all 3 handled by:

drivers/hid/i2c-hid/i2c-hid-of-elan.c

Which has per compatible match-data with the reset timings.

You should probably extend drivers/hid/i2c-hid/i2c-hid-of-elan.c
with support for the CRD touchscreen and either add a new
compatible to one of the existing 3 bindings; or if the touchscreen
controller IC is from a vendor without a binding yet maybe add
a new bindings file?

There also is:

Documentation/devicetree/bindings/input/goodix,gt7375p.yaml

which is handled by:

drivers/hid/i2c-hid/i2c-hid-of-goodix.c

and is special in its own way.

Regards,

Hans



