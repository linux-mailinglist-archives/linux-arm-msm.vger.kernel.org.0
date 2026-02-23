Return-Path: <linux-arm-msm+bounces-93686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGqlK89YnGkAEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:40:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C317714A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1919305DA4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC07B1E834B;
	Mon, 23 Feb 2026 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBdNugef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cR4R7AW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58D921CA13
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854005; cv=none; b=FBaJO3sF97+OC8m6Qyr3ya/K4L3LLFaPRP1k3NAstz1DQh8TQuK5fHlyBDJ35w4SPsAfExXajwlpaGp0RntHLaZTR/jpLEt8oTa8rmDXXHFYFYohfih3iP3zLlL6Ss+4r9VSg3ltq5iJS0stC+V4iRX5INeqbrZT34nVa2xkrU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854005; c=relaxed/simple;
	bh=XVY/teWmIRKG0bhadE1kKsMkinPkfohwJbkc0JjNgCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u6qRXuiU6+/aTtVpM7LTeUpZvT43Z1Kz2bCuWbrt5jcxsKjRZrWHkJ7YLzvgHaJZ3v08N9oiCSHILoJFBTctIHoW7J9kx27+dMXhjsJF919FR2OKBjyALNI7JIwwsh76XVq2pjt/PlcXToMWUWyDXtcMoVyJdmqx766q3qWlL+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBdNugef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cR4R7AW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7JeIk1423380
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4/QIr5UHiT1flGxYWTgnSP6v9y0V/IaNeyzeH6czwU=; b=gBdNugef63A+9kLN
	Oxq9N29XlyfrqdScFUaLWevZ/kSIj6joEHbgXo1oI2+SK+A2NMlU5Jwe5CB5EV2R
	uvdiWyfGPUB86LZQRznWfibKdjsYNkP5I4NhjTf4ERpNtkVdHdx/+yZRV7E8O0p+
	dc7tqILIJRD1PuB23QfamUTpnwgdCyhbK/ChnLw5iTSWPz50rDP/Lv59L3TIb1eD
	8zp55gBRD5uYae5t+PmMN1A4AgQgjjjSnhrqRjdyi0QGjIUWmhi1O36ttQF//7+b
	X/i22IdDzn3HagI71DVVXD/RiTJnS+ZON6biqw7t1XEAHSxqNNPlUsBMPo/U4+Oy
	fomefg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgvxvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c0eb08ceso31245835a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771854002; x=1772458802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4/QIr5UHiT1flGxYWTgnSP6v9y0V/IaNeyzeH6czwU=;
        b=cR4R7AW56DRUxoctXuz4walS6+e7pgUfVUTuoj/SE1e3iGj5HAqId+c0srwEbyXdm8
         oze/aHM3WpTiYPoE8Iz5gVyvk3FbAYj+1IkVB5VL28mD50QkOz4blWXC06Wyln+htHDp
         Qg/7iHPHxliiy0mqbAP4cFBTXaIeimMWMlRc4crnkqhTrsZw7IclCdDMH4colxNFkSLr
         lFFx7cn7/h0xZSQAZ3Kbl0a88tTSZ9Ngy6NLP3/muHHHL8pvmLKnfvHOil+/SpSyDn21
         zBj5JTKLa0ku2AboTuiKAaj+EVA1zKubpQTRu5eykLG2FpZRGvKGRbX69DZWcyjXwjEi
         /BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771854002; x=1772458802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4/QIr5UHiT1flGxYWTgnSP6v9y0V/IaNeyzeH6czwU=;
        b=L3bWgXKiPKtv6EtpvOyaAqePwCX+sQWqSIlNlmOuUh6FRgeDbutWhFrW33LMVWEkg+
         RucJzMR96gc0bvM3f2lumMIf2cCoS0tcQQ7xVRiLZTfMhWrNZYxhGJEyWmLrwtpV0osZ
         HNU8S40hSuf6CstrRB6dr4jpOWAW6Nt+hFJ0uK8l4gYAEYOIRJulTESKKlLtYPyZTJKR
         cyKdR4qYvEdjqDv46eX05FgN5bR8EtdKyNoThXmLETOxmDp2UyBs3k/HVvKbsXaBQo+Q
         0uTO1BxFWcvEGpPJ9LQrE/FcoAuqdog8kr6xBNLOuMc6/5CSt8YWw0h3YcVZI1Szpk1L
         arhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3IORFV86OBocI7bZcf+k/bpicb1uM16wyjR1dgGCYklvQTIefFQ04hypuufRZB7JNE6HeJNJdniNkHbBv@vger.kernel.org
X-Gm-Message-State: AOJu0YwaRLs6zHGtTaW0KQs2w/jagdYr7mQHWQvDhwIyu9eGtevrKfbD
	i5QgI9EgOgZXOoLH5dEn7r8PH+vVUPixa7ea1nxP7uHeZGiaKD35oGzpO6ZyAG/L2ENN47c85sf
	Yw9spIOmkbui9eHhmz24TXWuj117lOnBgjxT42gmLw9VEEHL5UuX2s/Hixg4uyPd9utpG
X-Gm-Gg: ATEYQzyHvhyo7pjNmQJx/PW0cRnq0noEdiCjwpi/987frKDYWbSPNR/lCdEghglcn1g
	PnRxNSavBw7g7CAUFD+zS/GFcBeKTke9rZH8c8tjlN9K4kHGKXcezTc9Mk8F0ht2WJ/8l7v0hmT
	DqyeSfDFmyhqWq0RJtaviAtxQI9RVaTRY04K6VLE4s7fmqTOVEgzanWgv6nNUD6GQAEIaffm0DD
	RGZn1Rt3+DkKEh+slukpSVH2lJWJl7bw9F+OeIDMf1+/ggzEFB1SW+RTO1UZsKewuvuzlTgoJDB
	38Tm6S9ulX9aLvLznwU/a+hiRVEmBIbvL6Phakf83BN9zAqnsXk8im14/qm1/ZrRwthJi6UoJSN
	+li01vriE8c6WP8ElBXWGiAQCT0C6OP1eZlqEtA7V8pnOaqKTFlP/Ag==
X-Received: by 2002:a17:90b:1d82:b0:354:c7f8:6d7b with SMTP id 98e67ed59e1d1-358ae8d0700mr7338172a91.27.1771854002242;
        Mon, 23 Feb 2026 05:40:02 -0800 (PST)
X-Received: by 2002:a17:90b:1d82:b0:354:c7f8:6d7b with SMTP id 98e67ed59e1d1-358ae8d0700mr7338136a91.27.1771854001684;
        Mon, 23 Feb 2026 05:40:01 -0800 (PST)
Received: from [192.168.1.5] ([49.204.105.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a1b63088sm7338194a91.2.2026.02.23.05.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 05:40:01 -0800 (PST)
Message-ID: <9b49a776-a65b-4210-b335-627a296049a3@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:09:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/13] soc: qcom: geni-se: Add resources
 activation/deactivation helpers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
 <20260206174112.4149893-6-praveen.talari@oss.qualcomm.com>
 <05340972-2013-45b6-801c-7e52fe48cef0@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <05340972-2013-45b6-801c-7e52fe48cef0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfXxq2PfK/wrTrC
 Xz367+6wFZMNr4nOS+pVW3FhT2/BP1i7uoNNlKajPS6PwUrDA2z1oDf4SMEUcB65ilH3a/sHeHG
 aZLZLQwsIPfggLo9VKl3GPTlF2XGond6I3q0b5/9WEjmjlLXu+JxmGFqfWgiZLqCavAeZ73HhQT
 8gQ93BmVe5IpZEsszSHqADWArdUXv1SMDe+HyJIg0pPnB2tjh9T0oAfOJu9vaXVBstf3HaxMRTY
 OEbg7FEdfdyacRbUoF3a0ua7PB4pmn6xYIpYqSIS5grnLptnnT81TnuWsCIPfZa3LRr4kH6jnWv
 7rt1PhYLmF0ck9S7dW4mpVZ56FZx0hFEu5TFMVN6geGK59Z7LJtRU7VTWvfypg/ZOc47hGt15T7
 GG+P89gxdWGA2IyZ4NfIJqYzdXkgVuxLlu3S7BAeq901CSNsvDtMLcf2yIVCuGYNcZudhtJQeAC
 5k9YoI/LLkg6aBEn9+A==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c58b2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nVOepZjDv8C4mF6t9zHebw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VriMNdUBh5tPIKgiUd4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: GUReEXak_BY5A-OA5OCYMslBEzP-buYW
X-Proofpoint-ORIG-GUID: GUReEXak_BY5A-OA5OCYMslBEzP-buYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-93686-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 155C317714A
X-Rspamd-Action: no action

Hi Konrad,

On 2/17/2026 5:32 PM, Konrad Dybcio wrote:
> On 2/6/26 6:41 PM, Praveen Talari wrote:
>> The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
>> activation/deactivation sequences independently, leading to code
>> duplication.
>>
>> Introduce geni_se_resources_activate()/geni_se_resources_deactivate() to
>> power on/off resources.The activate function enables ICC, clocks, and TLMM
>> whereas the deactivate function disables resources in reverse order
>> including OPP rate reset, clocks, ICC and TLMM.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>> v4 -> v5
>> Konrad
>> - updated return value as 0 for geni_se_resources_activate().
> 
> I would really like you to include that kerneldoc bit I mentioned it
> 
> https://lore.kernel.org/linux-arm-msm/ff9a2aa3-1b2b-4001-82ce-198c61a4b637@oss.qualcomm.com/

I hope the below works for you.

+/**
+ * geni_se_resources_activate() - Activate GENI SE device resources
+ * @se: Pointer to the geni_se structure
+ *
+ * Activates device resources for operation: enables interconnect, 
prepares clocks,
+ * and sets pin control to default state. Includes error cleanup. Skips 
ACPI devices.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int geni_se_resources_activate(struct geni_se *se)
+{
+       int ret;
+
+       if (has_acpi_companion(se->dev))
+               return 0;
+
+       ret = geni_icc_enable(se);
+       if (ret)
+               return ret;
+
+       ret = geni_se_clks_on(se);
+       if (ret)
+               goto out_icc_disable;
+
+       ret = pinctrl_pm_select_default_state(se->dev);
+       if (ret) {
+               geni_se_clks_off(se);
+               goto out_icc_disable;
+       }
+
+       if (se->has_opp && se->cur_rate)
+               ret = dev_pm_opp_set_rate(se->dev, se->cur_rate);
+
+       return ret;
+
+out_icc_disable:
+       geni_icc_disable(se);
+       return ret;
+}
+EXPORT_SYMBOL_GPL(geni_se_resources_activate);
+
  /**
   * geni_se_resources_init() - Initialize resources for a GENI SE device.
   * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h 
b/include/linux/soc/qcom/geni-se.h
index c182dd0f0bde..2f7aba4f89b3 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -65,6 +65,7 @@ struct geni_icc_path {
   * @clk_perf_tbl:      Table of clock frequency input to serial engine 
clock
   * @icc_paths:         Array of ICC paths for SE
   * @has_opp:           Indicates if OPP is supported
+ * @cur_rate:          Current clock rate of the serial engine
   */
  struct geni_se {
         void __iomem *base;
@@ -76,6 +77,7 @@ struct geni_se {
         unsigned long *clk_perf_tbl;
         struct geni_icc_path icc_paths[3];
         bool has_opp;
+       unsigned long cur_rate;
  };

Thanks,
Praveen Talari

> 
> Konrad


