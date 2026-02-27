Return-Path: <linux-arm-msm+bounces-94423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EBnGFppoWkUsgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:52:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C51B5930
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2B733125D79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7C13290DD;
	Fri, 27 Feb 2026 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tawCJQB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C22D73AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772185676; cv=none; b=qUHjBbTa3Hpr9dPHPAk4mwWS3CbGdXpc2Csq73d0eNj8hsbnPtzZkEMXpKhVcA0+j04iOT/Zx4CivKLvW1qx0u44L2MGXFcRaPjwjklep/KwB1sEM6gwKvzkYnxGf6zD8KP++Q9bc2LlRXfEO7baI7EUyaTL9ljwxfcDbaCGNFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772185676; c=relaxed/simple;
	bh=sDqOLIElO9sU72I8htWWTt5yNo0GEDCaewrWX4E83eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCh2UZnpln94c8rCkEcZRWRDpgxO0VzYGBWgy0EFLhmv/qXvitlmWpaWYbdiZP4ksN9YoXbKtBT6V+zoThmC5svvzh9V5aB/Vl1GwcsZP8nZxzOQdmxvw7i5lphRSihbp0Yy1jzGrBYhAOfTm+t7Tp1InPhnqScO6WkxmjVJQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tawCJQB7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so20160205e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 01:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772185674; x=1772790474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvnzu0nnoktPCLf+OVvM4xkOpLiznX3KsepjyKiu5SE=;
        b=tawCJQB7tfggauC1TSg88aUG+pHpHclM53cndGvlsNz4NrQFs+I8UCJ6GdHKqx1RxV
         1vYSwGL77XHCQ9nvDrjllPg+fZR40XhHT/7xy9C2VX6STF7BGecOD2BFsLTYHISicTp8
         N5HU1APBIzVCrmscvO2TYfTAoliRtvLbOWqy97VzFUtRJbiU6YaesbL3BevcMGxWCFbj
         XIYBXRWtbBQW1tin9nNbI5u6CTGmXy4Qwtf7fk1zq6EsI+Cs72AJopDgWKfQuAV2eCq9
         2E4Qhl1MnJp++sI0MKAiy5xz6oK/cqKdkh10Tc5OUgPMnAmY0pGLg8y7IBA1zEe7BJPX
         Ercw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772185674; x=1772790474;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvnzu0nnoktPCLf+OVvM4xkOpLiznX3KsepjyKiu5SE=;
        b=Mok+56NjLYSQRN4soQ/tbvD2O3ZfqN65HOZ03wlJFtwESMCCiT7vHvAghGt8EqsCZA
         CLLGDV75zOnUjftCi4vVGaLZ7cKioOmRhzPGmDOzFPivGez2vLnUCSutjJksg3POsJkJ
         ipSj+xr5XTb3CxOtyB368LQqMzxdyyJTIKCqODcZ0ofI/gXOY4GmB2dVWKOh4ACZyX1T
         V/UDkMntWv/L1NM3jEsfIzmLfgg52kRwtGNTWfJ6Ixrj4BciPoU5g/ddSQH1xkuwkuxZ
         8Imj7JfwBuyugjum1duFf8ZT6yZEt6Pd17waervdqCSINo2cNIqgn7gXIG5j8aIi4xPT
         BkDw==
X-Forwarded-Encrypted: i=1; AJvYcCWykOno758o0++/jzQh4j5obUlGh1YePgDQ/lIOQIiFloflpHo98ZI7uCs9rdYDt6sdckIMewyGz78j5LHD@vger.kernel.org
X-Gm-Message-State: AOJu0YzA1nanNhV7klmIvHzxb+/WApM4vhhe5uXs3M3c0GjnNe9sMcjS
	CyVuA8waNCyNiI3u2ZuF3vP/yXkw26ibTKhm21HkN49b/hMIhkNp46qNj2lD7wVZ1wo=
X-Gm-Gg: ATEYQzzfWT9nDPRCT8KvJOaDRn4VOZLxJKEqoej70amfyYlmJI//vJV7KJg83uoVZ2j
	o5YUVwf/4xTFDaCcsVAJlZ0rpslJ4QTGbhie9U5F2AAwcc+72hLf9lMUp6uI1LaPFBB3rCD7F90
	uCzaEwdZa5jPZQiH6jY1nDryaupjdR1/8k8/BsqDbL8tj/pQYGjvkHBDvnk7lHFTwIRCefYA0Yp
	cgAa35afOTZS/EkMfpFdtPy3PLsfh5D7PSOP7VcQUaja+WyaeST2Nc6ikTAyFjbx3gdPcKtN5SF
	SSVYaUq3bJ0Q2suTAADM551vvRHf/Gd++WD1i1shkVjhqb/PNGWUWdU4VClcfhMqc1xYhnMdxu9
	KbMf50NFbjF1abS6L56mRdcTsFRmb4lSEHCG6gar677DjS/lNCOtthnjbar1rwJWlQ8nGopGtWv
	XoosQeo39fIZ8Ffxq4wG+G9UhtEGOfXKcdWy6Kbtl64guyFJ8RDm0Juos7NI8Llc9Iv7vmkAAdl
	nA=
X-Received: by 2002:a05:600c:46c4:b0:483:b505:9db4 with SMTP id 5b1f17b1804b1-483c9c0f1d1mr32779065e9.31.1772185673668;
        Fri, 27 Feb 2026 01:47:53 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770c2sm92861155e9.10.2026.02.27.01.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 01:47:53 -0800 (PST)
Message-ID: <44b01d94-427c-49d6-bac8-a5d14141b24f@linaro.org>
Date: Fri, 27 Feb 2026 09:47:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <20260227-overjoyed-spiritual-saluki-7561c2@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260227-overjoyed-spiritual-saluki-7561c2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-94423-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B08C51B5930
X-Rspamd-Action: no action

On 27/02/2026 09:41, Krzysztof Kozlowski wrote:
> On Thu, Feb 26, 2026 at 12:34:25PM +0000, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>> PHY devices.
>>
>> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
>> have their own pinouts on the SoC as well as their own individual voltage
>> rails.
>>
>> The need to model voltage rails on a per-PHY basis leads us to define
>> CSIPHY devices as individual nodes.
>>
>> Two nice outcomes in terms of schema and DT arise from this change.
>>
>> 1. The ability to define on a per-PHY basis voltage rails.
>> 2. The ability to require those voltage.
>>
>> We have had a complete bodge upstream for this where a single set of
>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>
>> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 114 +++++++++++++++++++++
>>   1 file changed, 114 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..c937d26ccbda9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -0,0 +1,114 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm CSI2 PHY
> 
> Qualcomm SoC CSI2 PHY
> 
> 
>> +
>> +maintainers:
>> +  - Bryan O'Donoghue <bod@kernel.org>
>> +
>> +description:
>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
>> +  modes.
> 
> So just to be clear: this is not MIPI CSI, but only the CSI PHY? There
> are no ports here, which seems fine for the phy and will be in the MIPI
> CSI block?

CAMSS ports map to the CSID - CSI Decoder yes.

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,x1e80100-csi2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +
>> +  clocks:
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    items:
>> +      - const: csiphy
> 
> probably: core or iface
> 
>> +      - const: csiphy_timer
> 
> timer
> 
>> +      - const: camnoc_axi
> 
> axi or noc
> 
>> +      - const: cpas_ahb
> 
> bus, ahb or cpas, depending whether this is only one ahb or this is bus of
> some cpas subblock
> 
> See also: https://lore.kernel.org/all/20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com/
> 
> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2:
> 
> Just true. It is not an array.

LOL I asked a chatbot to review my submission and it told me to change 
this from true to a list.

€90 subscription well spent...

Thanks for review.

---
bod

