Return-Path: <linux-arm-msm+bounces-103619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8cDlGvCC5GmzWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 09:23:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C51D4234DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 09:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8293C3003482
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 07:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778CA33F597;
	Sun, 19 Apr 2026 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCVBgF/t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzTBaQva"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228392690EC
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583401; cv=none; b=kBpH5sir79XzpGmVwN4ptizwEmdPVBVNSmEPC7gtS8RF5SieenpqOxiUJCEdehDPjCPg+QQ1up4RVcyCQ9vskWC0lR0buldBv7J/pW1cF50ayBWRxMLOD+9C2KALoJwFVIigThZemy4AZB2D9TbJY/MfxrGSnpRKplZosOLjVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583401; c=relaxed/simple;
	bh=257lSjm/Bp3h6Rr9izT8uBqkj1IsKYe8tuTbSZrt1gA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fl/FC1xXAN9LkXklebQfoJtR1jwa5o4XHS/72P78b70uRr4R0dOfu9fem0O1kLrjKL6kT/lvphfRMfrzlMc7AB/zYA/9oc1m6xYonQLUT0YnQixqkWRkeBuULzBZSNoJ69LfJH7N+4WLvNShbHAjNMuW18jVpRIGNPuymCPdOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCVBgF/t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzTBaQva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J1xNpK404245
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 07:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPPrZwGlL6pCdWsqU3Fqf77VVC9zY2wlw3bVM4jVITo=; b=NCVBgF/tDxm3JIE6
	fVOQpHdXD43OgkUMjkiJ36FEGt7qG8AoQUah5mPbjPo97f0QBnrhfqd5yXX9oxsl
	0ane8QItrJmDQJ1gNxf1zcEpnQ7rulMyPD4CQw8GJyOPPdGjN8izdvU1vgKcQ1KS
	XT0Epl1C0RDNXd4HUagBXiOSauzJ0PSLjCQ9i06am8PoEOaSKix5gXr0dUB/A16S
	naHHHs51a6Pz+1GrrQHUdACSrBSc7cZh44u9hG8KWAKxME+tdwcKG+OBA0+zKC28
	vOaKW/cwFE+7TPZVV1SzKDqMUvWxhTDh4j1U9mDzXSITthRqplP/cZVo+sPYmb9x
	NrcyOQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y629je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 07:23:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so4012024a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776583398; x=1777188198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPPrZwGlL6pCdWsqU3Fqf77VVC9zY2wlw3bVM4jVITo=;
        b=KzTBaQvaclpMrSXzciKU3idKGYHYvKDDVgzqP3V0IwLcOudnTt5DwO7WHoyrwMB6XN
         Ndq/Fno+3uDjxOUGluKwN0e+aDuJ2GH9zvUmhaqm0n8OkeyZw9ImI1PzRvBwjTXvYfYd
         RQAks0D8uUyB4uobfUpmd4cd8Hy2e38poeB7wPNndI8Dji4/8gL4E5NZciexA8QvyyLh
         929VEMv28XfczJCrIkC2x4XfCnyyjcxlMlJ8/K1Biebrc1Mq+adB6epuX3xxTFpnXVlQ
         DeAgKHW6W4h5ty59WJfcci4ARq30Ke4/gDGUCGVtS9O+Bhl04pQGesXRc2IGNqWhYYxy
         6b3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583398; x=1777188198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPPrZwGlL6pCdWsqU3Fqf77VVC9zY2wlw3bVM4jVITo=;
        b=b0OhDQ4neUS9+NmsyZI50Y/+8+pg0813InrjKfP+rHW0G8xgzpDc7iUQD9lNsuQRvp
         AXTrH8PCuKwrYQWnoieGDOWQbeZsKFBcBKjnao/YCSGd2XSn2kOFnYJQ0KKLa7DWPCoi
         fIT+4tVB/BTNAojRBDR4nLBi1jigHKTSqgmyme5XaKuzEZCAygwA2Gy6gCEe+1FgtExo
         FX1R9o+Qc4cXCXjQbQVT/eanL8wIEsjLSG/L7padL059jTt56E6z5i5GexbQzYoddxtb
         /xelC/pwMS1cTqDb4OrbqShwP1GPwxduCO7+cMEqWC5uH8MB57ohaX/1JfEHrTXjjAF7
         UjZw==
X-Forwarded-Encrypted: i=1; AFNElJ9wsemjNcmapWFTIYCutEsqbVrwTrHnBgGHJLFj8PdW2W6O24V+v9QKlLFFsXpcAlEoKYAXn+mxlpOa/DY+@vger.kernel.org
X-Gm-Message-State: AOJu0YzJA2n8bGPYt8qj9EpyXJ8Vl8YIllRUBRa930g3h0hx+3lXPsX4
	Tngk/kKD/7wlan7x13JpUcMTT4h+d8OjngxN0t/ctYa3uLYA6V0jg9bXAjBVFJ7BOw1j8Dva1TR
	yDgggQfACICY8MUpFESDHeaGMFMw3qRjmfEWxxOQq0rAxKWmYK+Vwc6R0nugZU/nqDJtU
X-Gm-Gg: AeBDietjMYZcGHcHsXIeftdblGxUr9RpRDVb5gBr0wmsrCXvWcEac2cPGXnVSz9SE3B
	9ZU1rlGQcgfpiQGjwjA+MbZHjKqDdel2vAm98kTba/NINgUiZp/VxMDuUj3AVpx6+gl6OzSBRdu
	RYywgWkP+S9cE1O4Gce6KGOzie+6QaG8ABoANflB0O3gu55RFsdJ2AOfK0QN84jif9r5k2kw4gD
	LbGdTygBC+DVDDgoig22WeiAQ1RUpZAbXfhQn/fOqac9HNTjhlWy6M6aeEl6ZspdO+2OksZVfgq
	rMpzSOv0VmrBZNqTO+eq+4zxUG4l1MoF5AvWsNQ7MmmBrm3wRA4PhrkWqPfSAqKZbKO3fJOThdL
	z0oe+s8a89295FrgbX0wAN8+A0QxyVc1wr8FStdDj9A3d+HBgODfiOwMCJqa4/jcs
X-Received: by 2002:a17:90b:3b4b:b0:35d:95eb:879a with SMTP id 98e67ed59e1d1-36140463601mr9620985a91.13.1776583397750;
        Sun, 19 Apr 2026 00:23:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4b:b0:35d:95eb:879a with SMTP id 98e67ed59e1d1-36140463601mr9620966a91.13.1776583397272;
        Sun, 19 Apr 2026 00:23:17 -0700 (PDT)
Received: from [192.168.1.10] ([122.179.227.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab55062sm67374365ad.84.2026.04.19.00.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 00:23:16 -0700 (PDT)
Message-ID: <54edfe36-ebfb-47aa-b71f-6dbe10eadb1a@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 12:53:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add memory-region for audio PD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com>
 <v4nqsxnapoyrfifcrjjunhu5s4ggl444nj7gdonghqmhbijiej@fzafvs2igmeo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <v4nqsxnapoyrfifcrjjunhu5s4ggl444nj7gdonghqmhbijiej@fzafvs2igmeo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3MDdWBvayv5hxIKZw1FKGeY16DpNTMF4
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e482e6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xJoAcIQ2wYp4krwY+vXiHQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uf7FzbhFphQq29a4HVwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 3MDdWBvayv5hxIKZw1FKGeY16DpNTMF4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDA3MyBTYWx0ZWRfX6Pv0BafEL8YT
 DegMzIyy0+JW4r54tv2Yb+XusGCKJ+I6bBTOqnROGa6/XkWAtIdMbgUWfeEjSwRHZpEfRAPxFTl
 1GKaPifzYiBrEgMbraFyumQkAYnzpbSYU6QXHgpMeSjRQP9JTk0YziOXX6AuuYw1XDoIm4B7Llq
 evRdHNTWToKbeQ5GkeZuGav0vga28OjV0J+c/2qgen2KtUTUeFV9Cv9+AHQCe779I3BOJSk5SaU
 iOswB05XDTHU/XNOxNW4D0zFwW+5MeegvlPhJRE2d5j03Jw6WZP2zl9OoU8J7XYxrMXkrYUdHvK
 +E2epN6iPWFyW4rzJPCFF69I+obNwK7CZeIrVTpj1z/yRvo99FO2wJlKPzfwiMUDXDUQhJyQFH3
 lUjr3UlpCCzIzgN+65++t+jE7Ii4PdAP+RDTZCSXPd4eFDuCJg3VSwkqRNhd3j0wLrIleZK4NiK
 qzU3Pz8JFpTa9EEaxPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190073
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5.211.3.56:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,5.211.11.8:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-103619-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.909];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C51D4234DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18-04-2026 20:45, Dmitry Baryshkov wrote:
> On Sat, Apr 18, 2026 at 11:18:01AM +0530, Ekansh Gupta wrote:
>> Reserve memory region for audio PD dynamic loading and remote heap
>> requirements. Add the required VMID list for memory ownership
>> transfers.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index ff5afbfce2a4..c36917d6e0a9 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -11,6 +11,7 @@
>>  #include <dt-bindings/clock/qcom,qcs615-videocc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/dma/qcom-gpi.h>
>> +#include <dt-bindings/firmware/qcom,scm.h>
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>> @@ -657,6 +658,11 @@ pil_gpu_mem: pil-gpu@97715000 {
>>  			reg = <0x0 0x97715000 0x0 0x2000>;
>>  			no-map;
>>  		};
>> +
>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@97717000 {
>> +			reg = <0x0 0x97717000 0x0 0x800000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	soc: soc@0 {
>> @@ -5100,6 +5106,9 @@ fastrpc {
>>  					compatible = "qcom,fastrpc";
>>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>  					label = "adsp";
>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
>> +							  QCOM_SCM_VMID_ADSP_HEAP>;
> 
> Align on '<' symbol.
ack
> 
>>  					#address-cells = <1>;
>>  					#size-cells = <0>;
>>  
>>
>> ---
>> base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
>> change-id: 20260418-talosaudio-b8ecf8b9a1b3
>>
>> Best regards,
>> -- 
>> Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
> 


