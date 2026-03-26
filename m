Return-Path: <linux-arm-msm+bounces-100100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIIRJ+QPxWkI6AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:52:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4A333C8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B69F3066BEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A481D33C53D;
	Thu, 26 Mar 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFM9xEKA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNJ5IN6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3097D2F5A05
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521944; cv=none; b=i6+Dx9EtNxeYNzSZ9JGXD860iU2rR+Hf1ekLGZ00Xtn/olO5GiX82oY7HMOedJ2BkgxZtxUYli6A3aB9RVfMyxkLyG6q04Hq1ZcKo5QHlT9JBmpx/KKnzApAXBlU3grLH8f6Cc9ZAwUtHuSJOPTOd32JFxZ2u/X/9EInKn2NpHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521944; c=relaxed/simple;
	bh=KuE5wMXOF5HDbAynVpU3oy802Br8p58lz9x7bevUe5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wv4APHP2DrWxy0k7JIg/WlsFxxrqvBtLRUXeJ0UKbkXgNQu31Pqh6lsnx1SOCQnG+mLYKUDsw9Sucwx4CCX5gf8lmrTzfYMaS9DHF3m6r8YqqljY1KFeh+sTvkTRptV4dTcZhiBjXvIQvpQ5O4yv9UKUOYI+ckqqReyHVFidKFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFM9xEKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNJ5IN6p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q73lZH3070106
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wr11UVgqGoxu05TLkOfnjgR77V8kxzjaqIhhpa+9RfI=; b=DFM9xEKApWvq8G7d
	Phgz+UslHMg27+So/3F2w88xVAP//Sh81Bj/6kjF4mW+HhAkRnTG4gvhtsHestsH
	kHR6HlVA57FToqI9/IXk74tRAeKkzf4L2qg6JV+oH31fk44pve8Eng6y62S41arP
	Pf82j0BSgGm/UHwp4YPXuHicR3nPYZ8zYEukLNY6RJQb5siMSC6U+81t+o59x+Yp
	qqz0gk7wyN1PJFrN5Qfof+4Bv4w0w0wFJXSbSAwTOMlPC7GDC/ZLB7vtorbC1k1u
	484ZJ+QQqyy1ojvmJfecUS6IwbJpvVIBrPXd5pnMfIBp6rntTnrOOFwCGK9etxm+
	zfuNng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn268y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:45:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd97debc51so27552285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774521942; x=1775126742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wr11UVgqGoxu05TLkOfnjgR77V8kxzjaqIhhpa+9RfI=;
        b=dNJ5IN6p4pyOWXRrnzIDlAhmf/froZaGgcu00GZcJ6SUzdGW2b7cdm8kHmFEQ6PWFG
         CM3cHaet4WZ5pqWqddU++5TmfxMuXspcMY5orDKaLbudxx5sEfPPHGiblxbNlqFw6CpK
         FMudJpYIqrmkbHZsL652PUji595ZXBX901pE+jlJIoK61g/ha61yx+OSIjCLCE5Ou7YZ
         5kXf1mr9XbIArv+KEBbZM8YTyoGf1LiuZR1woDW0uB05f7J9qePQN864vxkWC5vgj9rw
         ijDK7lrgIIyczWyt2g9gTYSyNiTa0wyFHiKj4lG/PHbr5wKTPsyR4n1xHaN7LuYtVqWt
         gNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774521942; x=1775126742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wr11UVgqGoxu05TLkOfnjgR77V8kxzjaqIhhpa+9RfI=;
        b=kNSZRQHoMoOx3B6YGyV4QseLAX4giYYtV44XTUV7nIUW5nKcx07An1dwsGq8U+C8O6
         Rqjgjz7FuldO6IsK5P2GS1GgUdwl4V2e/kTNB/j93/hhGR8HuvjD+4XWu4YFbjWA0Ci7
         KQImOe2Jt7ri0hWl8HDzIWDvtkh2L+L2PrqVkb3DQifHotofuWHVaWZUnqkE27o+qP1g
         YjtQCc3kpN1r6MIfL7n/IwLbhO8H4qNV+2OeuRNg41DLj/AOGL3Y3acVveDidawMUvnU
         3vVmxG5tfHVfiEZRCe87+RU56TW7wCasl0e4GnE9Njo0zF7pMa2IHwPQr94+tikSS38q
         3qJQ==
X-Gm-Message-State: AOJu0YwBzBGxhg6I1kt4Bx078tvLcuGzKjKl95Lm6t6MD9OB85FEsWsX
	kw8xguywO4i0mIF30haddAJaEGX1n8kVWsVPVpi/rpDxm2alDrHWbaJ7fhl9wPQ4xHGo2ahFP9O
	9ShyNDJ2Nq6t9LKZwIxlHb/za2fcUuMx7+/TNnGc3nc4VMK1Apg5pKI94R0JiIXD5UFbZ
X-Gm-Gg: ATEYQzxZ3wTKdr8DvC0BdVb0O94N8Kd6E/6SoAtCZQHZoUy51TrAHWtiY67mZ5T7uwZ
	/Kobl5HEUI7d/tU00koprAhZmP6zIonP+dEFei6Jy2xdMUp8KKYgia6CPL5VVrCxdYVhsER513a
	pb7s7XULV+kRRzfKZMsl5ags4ApP4vEDCignv2vXz4ddYt0Km62lrvSsK3VadcpmLBt0n5YPdI5
	o5hPXDjH8SJUsNS9/go44TMP3I0XmuOxSf2bh0HBu0utSXwYEM1mCV3cPSKYshyleU6s/TMD99C
	R57gbrW1OqHvOVDDaJliaCVwG9Ipwxb19X1xBwB6dlFGAn8o3xxOj1LUwN6T5Mqs5ciCUdGjThf
	FlUnpjZrOOKVNad48qO3z3DL6+x+14Ja/Ij/fLvTpn4+e8RonyYeD9lo0DQre5SZFrwa75bnaoj
	GDNsM=
X-Received: by 2002:ac8:7d0a:0:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b80cf75f5mr70961251cf.1.1774521941449;
        Thu, 26 Mar 2026 03:45:41 -0700 (PDT)
X-Received: by 2002:ac8:7d0a:0:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b80cf75f5mr70961001cf.1.1774521940881;
        Thu, 26 Mar 2026 03:45:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265120sm102392966b.16.2026.03.26.03.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:45:39 -0700 (PDT)
Message-ID: <9c7b16f8-047a-4cec-b34a-28b94040f9d9@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:45:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
 <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c50e56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=oh5tWtvl8tmv48WKmsIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: mdY2E7t-UGz_OCTPT5KRYw-urcT_Pf_G
X-Proofpoint-GUID: mdY2E7t-UGz_OCTPT5KRYw-urcT_Pf_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NCBTYWx0ZWRfX1t8Vwpcir945
 1ybG0vn071IsCY9ZegIzUX8RvcnwyDtgtB20Njnx83ZZ15xi0xCCYwoyruetJ/JOYHr9FammgxO
 zEZ6erNu6+yKufuwtgCaGNcI3Ku/MpabTU5b8geia+uVr8VbvlB7jv+7H03QwuhIY362doiKkDj
 sYLxOK4B8YkQ2IoEZLHAD5Jp4zLgT/zZPyX9KfDXm2hqI0uraSxHCun9PLaDme7QuMDLYhK0dc9
 lrVjr+4xv05zeZTEBVd2LvaxaJBiHRtdl9RyAKHF3Q6cfydd5HFlDpE5yrZ4rPIsclLB582Dh1v
 J7shJOl2sDXKiQCwNn+cYVAlTyrjTDvJS7Ymy8wjl3rvm8CNsvcJOIkS7LYc+ROOcFdv2jml59d
 sV+UEPUHJSqLm2Tyf+uGXuPACNTVhY5unJPsOvQ9KjwuWixiWgeWTYBwqTIg45/jD3CRNNYcRyL
 o4xNxK9tSu95EB5+izA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100100-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AD4A333C8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 11:34 PM, Bjorn Andersson wrote:
> The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
> ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
> display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
> headphone jack, WiFi, and Bluetooth.
> 
> Introduce a DeviceTree describing this device.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

[...]

> +&iris {
> +	firmware-name = "qcom/x1e80100/LENOVO/91B6/qcvss8380.mbn";
> +	status = "okay";

nit: \n before status, please

[...]

> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j>;
> +	vdda-pll-supply = <&vreg_l2d>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			/* XXX: why @0? */

Because the binding defined it that way

Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml

->

ports:
  port@0:
    endpoint@0:
	Display Port Output lanes of the PHY when used with static mapping [...]


> +			usb_1_ss1_qmpphy_out_dp: endpoint@0 {
> +				reg = <0>;
> +
> +				data-lanes = <3 2 1 0>;
> +				remote-endpoint = <&dp_port_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j>;
> +	vdda-pll-supply = <&vreg_l2d>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			/* XXX: why @0? */

Same here

other than that, please fix up the odd misordered pinctrl-n/pinctrl-names
and feel free to add my:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

