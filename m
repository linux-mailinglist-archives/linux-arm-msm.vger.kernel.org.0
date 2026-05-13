Return-Path: <linux-arm-msm+bounces-107373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLXLNgyVBGqrLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:13:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ACA535D79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DA01300F5CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC29478E28;
	Wed, 13 May 2026 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cB9U0Ih6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Od6x+1Bn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127754779BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684968; cv=none; b=kRc6TkeGGWxYGLdsnfZPOeJBsqelQE2xHRfHpE0/QYyi/O7K1wxCyNKMR0EKXRPrIporR/lmPTiuxNTPn0iNHVsA6Wtv9+s9tP3Qj2ay7JiWxm2ojcHspiyJzbluRMDOayVZ5xUuFsktGvJA4emoiQHL7nhEXssvKtQZYTDIoug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684968; c=relaxed/simple;
	bh=G4SWJdH8lfXq/Q55qE5sancsJQ5dvaiL1/ql5G+w7cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r9SCzSju7LtXhMDedNbPNSyRXcUbfgG4nqqELAh3YQH8Ax1Wa9gEMwrP4mb+tFxP8D4SR40eHLOFPu8+2YMx7OVxk00TO2HnXsml552hv5pvHyOPhYglshYXLmdUv1ipsUwS2ugWMBmO5RJVpQIOL6fE1ZQmvNKMm67Z5NL1Hd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cB9U0Ih6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Od6x+1Bn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEiAXm4161609
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j0hB+em0HhLvyCaV2q9m7G7h2H9vaqkFqmGjp5daVGU=; b=cB9U0Ih6c22UxiBH
	PO/hyD4elkmS7CcgC/FwoeTSgjYN9OHqqOSSOMrm7oq+KnPdjokxYKSTKQ9WbPDl
	zQcZ9YUtQ6q4Rej8lsHH3aABaF9LdlW9aLT4Q7cKjp5DJEwPNXkN6m8RbimDGefz
	R6eUWhpJUb1Th5UBykxAodBRbBcZ7lBftIlGHoxTlnba/0l4YXweAooM2ZtzyD1t
	Z+ipbUgVyrs7rovkHMvl8n0JkYPIlF4Iavq5Qgb1Vv6qtUybwHDZrEhCZ9Im8eMD
	fzBGIYB9FKgGrtsFTcMkwilYNjLaJcqX5lxHDNPVdAV2O/GTe9YksSGBl60WcZa3
	H/DKOQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91sf57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:09:26 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so593706e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684965; x=1779289765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0hB+em0HhLvyCaV2q9m7G7h2H9vaqkFqmGjp5daVGU=;
        b=Od6x+1BnWx1djgN2tyH5KAMtzDq1mxhMQPYj7b5fhA+Fht263C/jgnOI+CS6D8Czrs
         8J6svjtAda8Upx9O5kxeABilwPOlyDHQzftr5cCpSBxk0z/8H29GlDUC59+vCH6CXFvt
         MH6gJySJEBWnze7lHRjyDVw5SvxNTjP00acZ6KibCT1u4UUysM6JbkiaMYorplEbwWRz
         9Isx44V0nTFO7TfKDnsUZVcyt2mUBxTIlLJ3KSVGIUIeaXWXRbWi0Y36Fhh1fKbFHgnH
         4uO7qBC+ZRptyHmJG4igSvXxOenwodG3KoycH2eNEVil4Gg0wDASevLlLyL0rhqYb9Zk
         /qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684965; x=1779289765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0hB+em0HhLvyCaV2q9m7G7h2H9vaqkFqmGjp5daVGU=;
        b=ijICum2PKBUFZdQTREyJfXMYC6PzbNY4o5pSC98/XwrFDQ/TjnzPuoLwC8hjm3te/q
         sfuKPCBCFwOH+GsXloZ/KUMZxeMDaTKBI8wGo8PKvTHGrtpOpFKZX+H55Uwwcye/VQda
         FowFy+F+ibmDRdQ0rwMw+cIJ+kZUMwTmYRGXmK47NrUwvr5wq51mlNBS4HtVEov7ZbVO
         5N8gSDWAFsD7ToNl8XWc8xbAqcs3iRMJFjQU7QKcKzYmFXF1Xhbw7DXcugaPvJLx5kwn
         pHBF2pVpFPVvOJbGKANrVMi+dGLFCPDiUs35xCXDUdSCtNB/r7cZTXrA/21QkeUNA0+8
         0FXA==
X-Forwarded-Encrypted: i=1; AFNElJ+VMCYTCk0+kAz56nn1OoLn5YoSqzcjyvDEYqj/DmFscMazr3WwPIEAivzmy07jKVLzG96H9FnHIpzYdGaw@vger.kernel.org
X-Gm-Message-State: AOJu0YyUTJlk1asXI3eg+lEjx1eInwlEHw7QgmATQsK5MJ4myqxyfejc
	q9y1/pFzQE6FMVvyoeNgaUSr2lYnOQHxxA9tJguiSz16erdHHjh6tV7RsvmsbE+CDkHl0UXtzyT
	wZMzyMllDsu6nyH4shyzF1uX47YiTdLHqnDdKzLn0t2kcI9u0oCx1e15QCDrWSXpXFl1u
X-Gm-Gg: Acq92OEp8CXxp5bVFIWAh2TXHOTpNG5I7P8AYZpEJnQ/EoIZtUZakcYegHWxDURQTh+
	Ra0boEbJCGEOZX562Bwc6HWp0O4V1fktAqMLeVTtJq91EJEoBPDaXhgH6bCKNUlpu+nDIb38eRZ
	8FbCe618foxtKqmT44yMHLINtzF0jd/8l9Md+v+kCDcR8HdsRJo8+4sgYvWCmz62a7ySayQdgt7
	Sqx7WXR5lW7Ezw0dJzLDT9OB2q/TYElC/dYvSJtggYMfsHtvt/aR/9QMTIluz7TVetuO0UeJOkF
	nB/exFu7JoVdWINx6RlLNu4sw8IWgpaJTImIDWI3JgpBuZ3Gg65zYl7VDE+B8Ay8gxlao1WtG4r
	eXtfkmmKCmJOlIn8kYMIrs1be7Za7DHVsiJ6YFlz+UexMHxcxL8Wnvkfg0v7c+ucOR4wzJFSVGd
	UUN0k=
X-Received: by 2002:a05:6122:1d9:b0:575:1954:439d with SMTP id 71dfb90a1353d-575e719b22bmr541737e0c.3.1778684965243;
        Wed, 13 May 2026 08:09:25 -0700 (PDT)
X-Received: by 2002:a05:6122:1d9:b0:575:1954:439d with SMTP id 71dfb90a1353d-575e719b22bmr541715e0c.3.1778684964835;
        Wed, 13 May 2026 08:09:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcfebf0ab11sm502646366b.62.2026.05.13.08.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:09:24 -0700 (PDT)
Message-ID: <ab036c8f-fdef-4123-898a-7a0acc62e64d@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: dts: qcom: Add Microsoft Surface Pro 12in
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
 <67c50d27e133774e0a4edc17403e4218ddd86efd.1778498477.git.harrison.vanderbyl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <67c50d27e133774e0a4edc17403e4218ddd86efd.1778498477.git.harrison.vanderbyl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N11kC3BBOU-ZzNPwdselXOrUNnYQrhJv
X-Proofpoint-GUID: N11kC3BBOU-ZzNPwdselXOrUNnYQrhJv
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a049426 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=B2TC37y4lXDFjVec2ukA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NSBTYWx0ZWRfX72tKQa/erpDk
 WRszWoYkJ0N/7WkCOBfheWBy3vyNqwJa3svQRJPXPhb75tcMOw/MLmnV+h6aRiE8VeS2cVUnTiE
 qybT9ofEjreDlrjvU1n7L3e6N5NjZJZKVNeKukjYNrG4WeDY6wuc2wANOGJHI0bHIQZ/q2/g1IX
 2sQmBEj5lmWw09zIYXLvg7A0lpHiJoPIg6QyKgLPWBfb6TYrlmHY4VP4+iX71NNgsmO7kw944mt
 2lQp7wLM7G3aDuZXvyZnkPLGLwZ9duCoijg0NbHpXBkq/Bys/9eQi+RogxyHDMMbEujYnF18OpE
 Q6mVNd9ZLVUU+bQXSXJ06zI/U1ECdnccg9xpp7ydAmgys3SH9GavfCXV7T2QV/aqh+Sk3a4w4PK
 z+AlZJNctDb6Q69jOgxIj5qc0Eq4xWLYMQzZFVrtX/VpnxfWCj4IbBNDs/EhrO0pwZpQUYg5fcd
 fsOm1iNwYUYkwy5GG6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130155
X-Rspamd-Queue-Id: 78ACA535D79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107373-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Action: no action

On 5/11/26 4:40 PM, Harrison Vanderbyl wrote:
> Initial device tree for Microsoft Surface Pro 12in

[...]

> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +				 "qcom,sm8550-pmic-glink",
> +				 "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +					<&tlmm 123 GPIO_ACTIVE_HIGH>;

Please align the "s and <s


[...]

> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};

'co'dec < 'cp'u

[...]

> +&mdss_dp3 {
> +	/delete-property/ #sound-dai-cells;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&edp0_hpd_default>;

Please make sure to keep this order, file-wide:

property-n
property-names

[...]

> +&ufs_mem_hc {
> +	status = "okay";

Let's keep status uniformly the last property, preceded by a \n

[...]

> +&usb_1_ss0 {
> +	status = "okay";
> +	dr_mode = "host";

You declared the Type-C ports as dual-role - does it work if you skip this bit?

Konrad

