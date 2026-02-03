Return-Path: <linux-arm-msm+bounces-91680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBF4BjH8gWk7NQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 14:46:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C77EDA1B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 14:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA12230A9A45
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 13:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC8639E6C3;
	Tue,  3 Feb 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJNKeuTo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HD13s9Yu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AFE3921C3
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125921; cv=none; b=g+jpHGuVpeBZ2g0pBRHZd1oJsx0CCSby7mt5iquM17SFosJcfvMeMQqF3Ncfkekj95/EhqK1icXfqDV6J9+v4aHOs7LuaguvyLrQWDgJIkaj51a+OnSonueJSS/QmsnV3JAUAuOhCtEraHSOgtvneHt0w0FHcawC56qpuhXzQkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125921; c=relaxed/simple;
	bh=Qv73lmQbZYMBOKSAxEjZKP57u5k9Nfbua5LdqE6riMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdRWNJ+GgiVMexnSoiBUEyYKFlaRptXlXd5Sb8bvJOe3UTlqgoHtZiulAYxBHCYyS9yyisMtJfnJY87QuauHiKkWjB3azjwBZhuoJxZegmanVoHGYCVjmIR2XJbm/mPg87H3VUC0g3PcpFvTVppXA++Mf45at4OyE6oWO+CCdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJNKeuTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HD13s9Yu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613CAA3k1191805
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 13:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W4FHKF8VjqcskeLt/BUuyQFPe04b8Hnj0qqZ8C6JMpw=; b=EJNKeuToChSWWyad
	uNiX0go4GD89t0Umxq/HHMW2LEfsQyCsJiuFfud9SQfdcJdufw3uj62sQ9ld15E8
	G8NNcAJw+78qRPF++fQvZVYWHMHM/OpJjLgUpuCDr3EebixSOjm76sJdgw+X/cSC
	X2q6Xfz+3vkb4D+nt9MVKYNMiZuioRCAjQsY4L2FQwGZdtuvvFtC4Jar/frKxx7/
	Oi4VfZ+zDOaAik0rJnaCqSb4AslhFGxsgyx2RXbFQuCeex/4tH+5y+cxRbyya4Fa
	DSFA2pCr5yFVk4PXiXIadGL9/sWm+MF9AgQ9V5zMsyIanOftqThoj/I4W35yU46D
	35Wy3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gsr07pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 13:38:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c710279d57so153302785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 05:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770125912; x=1770730712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4FHKF8VjqcskeLt/BUuyQFPe04b8Hnj0qqZ8C6JMpw=;
        b=HD13s9YuaUKRvPDPOHqQquHmMsErqDirInOOnk3gTUpy5b+QNknRirCctqCs7uVuGl
         zWennju2YLtvxJVvqmJJ32WibG4qBL6ZQp3AAG1lNNWUJjoaQVzju9A2uqGmP8QtevqQ
         usa6kV5HJDO9T8oVmbo4Eepzx+YLNRH8a9zIa4BXrPKAEWpx08jnirc58qj5LSYKcPwz
         nGwhRtV+GM0SasRxTBVE3VWTUshakB24tbjNpV8o+irg4GCPMNkgR7IyD3jdQhG+uTDF
         c8nj7IAUAn2V8MRdNsqzRMcxDoYxnu5rYhmthQ3Mz0nelhY7s2+61Ha9xI6sRlvP7xxM
         3pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770125912; x=1770730712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4FHKF8VjqcskeLt/BUuyQFPe04b8Hnj0qqZ8C6JMpw=;
        b=nIhveGd/lg/Y9wbr8ENi9Nh7Y6yZYjqHIcVeuWVTebP9oJnc8OY1OPiowRUAWLWuJM
         p31yvRG+WWz+/9k+sTQAcH/5f726JWxcXrUE3LSG3Rc+fXvl5S+Cmu+nLqiZi7tiO5A8
         zIys/LhZ568ld7FfyYoloOmL41rxBH5ix/arVPKpvYgf5cyuXfErcJfCSv7/2j0GsgvF
         WvCvXqzsFUX7o1ElF3QnBiqSFcemwlL0bLOS+V1nelNeg7OWgE6PSGfyKKOQlr2tjOoL
         X9B40q4H4hMo1Zp2Td29hMT8pWcUDOj4SSbssi9X/nuaYMQ9beCacsOwcRKEfh3gKKD5
         bY8Q==
X-Gm-Message-State: AOJu0YxvQ3flEzTIBIdHjSr73izI8L8o0jCNZvf77NbiOeq8tHm6JYvg
	jhHUYHrc0qGRQzErZxy0hwcSl+IGqbPVqQDgdHjPvTqehsA6WBDaH8XaWDYfD1ZyTDl6AGClx8u
	lesvkInI+/epBv++nu3RoMkLI8ICsfepibFF4CESR5FlPHmzDtwM283WdIgxl2daoWJsI
X-Gm-Gg: AZuq6aIlJ2OV49RwcNfxLpxj4adlE6doeU1vqk6HLGjXhvHdDlYuTmKFn7TaXizDLsO
	271TQv2JequG+arLBPJ5z6bu/hZYprBjseCIX04PjJL5dgGfGSb1aVW9dK5ETGaKk6o2ALuglnS
	lihiFIyYj81iPXBYYpJGf860Hm93jq0j5ey71hxqvE6qf3hvcL1hvB2Fr91hyjdQkOHGBZLMqqT
	wc9Kgu3cY4AJPk0UHyyNh4qRWogXuT6GF4oJJyzfeFYB1ulhUXDR4hG/Oqcm7S6y8G6n3kz5bMO
	/NR2Xhu5XaScmwQ4cH9DxiJiy1IIV14GugOoN5EGkWTZi9vKDFWcGcZcHbcZTPOsl/miDcH865m
	3gqrHphZB1iJb2VU49Qv0o8CcXCnW1kqy0BHGh+XhOSvc/ydr8iPc+QVCqo9pQkqVwCo=
X-Received: by 2002:a05:620a:4506:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c9eb27a8camr1419765385a.3.1770125911791;
        Tue, 03 Feb 2026 05:38:31 -0800 (PST)
X-Received: by 2002:a05:620a:4506:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c9eb27a8camr1419762685a.3.1770125911265;
        Tue, 03 Feb 2026 05:38:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de46abf6fsm827564266b.52.2026.02.03.05.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 05:38:30 -0800 (PST)
Message-ID: <ee0fe165-1764-460f-ad6a-9633b06776b2@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 14:38:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: qcs6490-rb3gen2: Enable EUD
 debug functionality
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-10-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126233830.2193816-10-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A+9h/qWG c=1 sm=1 tr=0 ts=6981fa58 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yEEpPANMKW__IVoBb5EA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0q2hYvxLMTxhCtb4NDp5b3IBmluWRASB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwOSBTYWx0ZWRfX021tOILkLAtP
 t/pIn6uJaK/3mdQ03zn1cinYwOh6yWY1z3u880C4ET72h6FKM+rxHjwDhJhAvc5KZYUiYe2DcjV
 JeHmTqsrs4VhAqoSwMo+QcuEmfMBIH6A6q88x9OJWgw+Pc2gPizYAO3f5hiw4YbGrY2CuHjdaPu
 ldYaGOrDz5dALgrpUGmYCsZ2AOCgp5R+7VP+rfomxAvcCWyYPc8opMDczP8xGaHgkkPgqiwQCPp
 ECoRHx0KZGzjoSiWKS8dg6qh3O/o0FxC2FXgXQXoEHLXI65JqI+NGjUnuTrHhK7mRuBqTcBVglV
 hOBfd1C/yXa6EShJdCb2O+b+2g0lYlI4RVJQsN47IeoKrN93y0MRYjvrpYGw2/D9nOxCGN74QA+
 en2pPJn3Y1au/q07HWSm1AO/KQOvLDbbDsc9BjH4eo6WKEhV9i3xkYzgBfesvZTvmwrGDvWU+GA
 mWFh+kUOV4bN8X7Vk3g==
X-Proofpoint-GUID: 0q2hYvxLMTxhCtb4NDp5b3IBmluWRASB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030109
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91680-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C77EDA1B5
X-Rspamd-Action: no action

On 1/27/26 12:38 AM, Elson Serrao wrote:
> On this board, EUD resides on the primary High-Speed USB data path between
> the connector and the DWC3 controller. Update the device tree connections
> to correctly map the connector and controller endpoints, and describe
> role-switch capability on the EUD primary path.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index f29a352b0288..2fc2d0aed8dd 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -194,7 +194,7 @@ port@0 {
>  					reg = <0>;
>  
>  					pmic_glink_hs_in: endpoint {
> -						remote-endpoint = <&usb_1_dwc3_hs>;
> +						remote-endpoint = <&eud_con0>;
>  					};
>  				};
>  
> @@ -1176,13 +1176,29 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3_hs {
> -	remote-endpoint = <&pmic_glink_hs_in>;
> +	remote-endpoint = <&eud_usb0>;
>  };
>  
>  &usb_1_dwc3_ss {
>  	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;

The on-SoC links can be deferred to the common DTSI


>  };
>  
> +&eud_con0 {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&eud_usb0 {
> +	remote-endpoint = <&usb_1_dwc3_hs>;
> +};
> +
> +&eud {
> +	status = "okay";

And I think it should be okay to keep it enabled by default

Konrad

