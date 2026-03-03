Return-Path: <linux-arm-msm+bounces-95114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL3AA27Dpmn3TQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:18:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C701EDA10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27C5D30FE8DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2EE3E7156;
	Tue,  3 Mar 2026 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWiV76S8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NqmB3ZJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A53E7168
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535668; cv=none; b=iWNAko4bz3B0jQ7/uwl5KlHP9O6sJ7FduAH3ydyQw2hnNAyNV7jkrEq01hwSTTvNPelY6/CViSHqWG2C/0Fm4ff6ccnKZT9SKA1P8vE+iX2NFh5VdomnLHKYXSA3XThmUXPBnIQ7QuoS3MXZf3F9C9RzCUcMVXSZnZyU9QKgOJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535668; c=relaxed/simple;
	bh=4utjPW4Sa2npgvSb2FnP1GRsBua9mkK/e5o4t14uXss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWMaaDzFdhePGR4wutasY98+gLZMNgrqP0k+Rwk0R7L1fOtFR8YhJirQ/kIBTv/xquRohfmwo7l9MxQnWJjArIDiOAIQSUTLRmBYRwqdnNdO7cGkiDB4r+FU05AAWK+XZpMkWn6No12P9O5mzkHD3vOk0yyQuJIdPM0AkxiFSao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWiV76S8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NqmB3ZJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mgTb3099421
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 11:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YQtyTtMzDq+YvUgrBZUuRFJhaYHSstW/drFh4M+XgA=; b=MWiV76S899qlOPKD
	PRS+Mc2aEYAuZMgfudQ7m4G+rTes6sOPvKt+JVBR8BOaJEvG7KbXzJnCYT911sik
	LdYOUWWeLOWpdb3O3OeSEQDs5VnYBsA5TRARqOx/7r9u8t42SnHGvHK2Rwj8MQbf
	vF9MHVxwFX9ebOAf0QYNyrd9ezjlwC8iEtJuqFqjPZxhXfikMrfRZyU3Vm+a8pMd
	uO7MsfxW0YkISjabZ0hfkNlSPfv3T5IN8n/tSKKGtri2i+GB85XH4FWnoGut23S/
	z/iDcm+1tz1tcwXEU5+1jjq9hcZDSX2RXMSxGd/pdfYGRkJbxLgsZYhlvfLAGEeQ
	epPnFQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu0m6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 11:01:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ad73f13bbso778448241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 03:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772535664; x=1773140464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YQtyTtMzDq+YvUgrBZUuRFJhaYHSstW/drFh4M+XgA=;
        b=NqmB3ZJ6ntTkoXMotv/NekEmqtIUKaaZGS7I0J4r6SEQtBtFeSnRCTvZ591T+qrRd7
         xg3R4eepUZDLLHlcosp2A9iXCZuGGVpnG6g1BQQ5HlLkiOSjkufXvaVuDAuUY12dCZgc
         vDLWaUP6TRIc0A0l3xeTue/2wy2VwVQMha3Quv/q5x4hgejXzoUpMidq+fUkr5SZep/p
         F5SQo9CsOXd17RkZHLsPGP4djLxdJuX+ScZxJurjWnk0A94F6c7PfSrLCbhP4vOT3YRY
         Ss7GMyFKQOEAIdK1lE9j+n1NIGAbcdbUiGpkCF8BTQYJM26BCRgkqtugvrVhPk0Nk9Gd
         kBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772535664; x=1773140464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YQtyTtMzDq+YvUgrBZUuRFJhaYHSstW/drFh4M+XgA=;
        b=sMBt0wFJOnZKmfeXbPtDX3IQEb5mlIUF7XiQ4mG78WV/KvgNC/xRazD/buxY8fGISn
         DnmV5WxNkfQF+qioOx457doC3EjBBTw5o2lTYdHF6jKixxrTplw27RVeO32D3iPXGwaO
         2p8GMbe9EQZl3IrXdmzmPCbwKJF+XEnWtziudPK7MBHKdHRaJD7Ns9Nr74oYjjbffBLW
         xX9qmKAh1sFvFNfcR3LTmmuehWD9JekjSh4Gzf71S6+Vm/dcXjm7qXU+Wm2dDS05FvfJ
         0G0RQvID2BTbEWuyRIahJpKo8eCvGEnkhADBsiUNBiBEe9SAEkasTE76fFcxWulXIyix
         fnkg==
X-Forwarded-Encrypted: i=1; AJvYcCVivq6BEVqOp8TOaNmtSPSYdL4yspz9GKDLa6Na0Nk5YO6MFWkR3l2knIKBwkWudHNbCIzy285nsZfsEtsP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VWgiXwIBpSIxfWOoOtMZFMdK9r2MPPSLEkqV6fHmFIPCTgxn
	sDbq+PM5yAJPRFS6zUt5sf7NFl2VwOnFIJyqBwKASBaa7xugQp/j3JBaAOL8+lzkHtb3CoFujVX
	HF6Uf2D6qQvyyA7QfHwcmrvB81GZXUCYaShuKrdzv6WaHgk6NxkI6EGliyyx5kfUI16Nq
X-Gm-Gg: ATEYQzyCITLEaQO5kUKxDryoi4NQ0G6OQ0tLowrSHYKEqctANZCbNOIyeT2rn7QMhXc
	0FZMWgBHqO8wNQCdnniWmDafgayyz0J8S1ks04liqIdGD2T/fj/6cThCAkE/tZlEIOw67k9lrSw
	ZoUP13IB0NUy91SeCA6/OrL55fouHb4ZrNiKPb0WJHoKYh+xMOVQ0chkX+FSf9kc+JuDmLQWns0
	VY7g/g3rwn55tVl1K58dLpQ92gEsbQJJlc3/VVlSJDKHxKgt3Cor7DHI68TNfk+6lwhvW3f5KxP
	laPptuv1jq3dV1Vo+dfj6v6nRHJiIYstALbUukZddoH5w9ve1Sgn91syXdOSdNx3KVixMBJGqHy
	5OdxbqQd+SAaXl6QlxLNviJ0nod160uIn/MPnwaVPrwYnyKNAj/WHcCTQrgCL7XTQX4Y2fAbrT1
	cnKyM=
X-Received: by 2002:a05:6122:6217:b0:566:3608:f8db with SMTP id 71dfb90a1353d-56aa0a96612mr3169583e0c.2.1772535664063;
        Tue, 03 Mar 2026 03:01:04 -0800 (PST)
X-Received: by 2002:a05:6122:6217:b0:566:3608:f8db with SMTP id 71dfb90a1353d-56aa0a96612mr3169564e0c.2.1772535663226;
        Tue, 03 Mar 2026 03:01:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd36224sm4380280a12.7.2026.03.03.03.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:01:01 -0800 (PST)
Message-ID: <8c9d80c4-10ad-4509-bcd6-087dc1293786@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 12:00:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 2/2] arm64: dts: qcom: glymur-crd: Enable eDP
 display support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
References: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
 <20260303-dts-qcom-glymur-crd-add-edp-v3-2-4d1ffcb1d9f6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303-dts-qcom-glymur-crd-add-edp-v3-2-4d1ffcb1d9f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a6bf70 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7exTVeyrrGsJc5ecXJ4A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1_VINBm-aRsETQQtNIP112FpyonhYCHW
X-Proofpoint-ORIG-GUID: 1_VINBm-aRsETQQtNIP112FpyonhYCHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NCBTYWx0ZWRfX00wiIh6BVdsl
 T4vEAGbce7CFlFehAKwjBiauTigyvjzjRZ36cppAvI+yc2WtPLYCVYCtZiwUQA2TBp4aygl25dY
 xmSJiCHkS/+eLwLDxGJHNrV21yRaqb6va8FNWqpZ0INNkQ0TMNK56Sk4ROA3MjQlMI/mkOvVByC
 jjUssMxpqAaAajitpnWtB7c2tDhdRdyislC0/1eUuADKKtyF/i1E33Nc3pINtY0CW0L7RZCyHn+
 OzougWOaJQDeJDajZmRe4oPhZzVVSwIIFIzGFSrKVvMzbkxv95XqafNjMz8chf1OAm+K2GkMIjJ
 yiLKaij6O+us/2mY1CguD0gcWntyYLIKi09VwyO5qtQqXKtYPxc5cdm/GWlFQy/8KSLuCmyDW3I
 vqM2tUEB8+pWoVD1S7z4Gy88u2oCAFWXLKxNCFsxpC+HBgRZVTVtrmpWcMsV8gQ0VIPY/1NP3gX
 qhadeWvLrVR0nFCrLGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030084
X-Rspamd-Queue-Id: 63C701EDA10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95114-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 11:44 AM, Abel Vesa wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> Enable the MDSS (Mobile Display SubSystem) along with the 3rd
> DisplayPort controller and its PHY in order to bring support
> for the panel on Glymur CRD platform. Also describe the voltage
> regulator needed by the eDP panel.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

