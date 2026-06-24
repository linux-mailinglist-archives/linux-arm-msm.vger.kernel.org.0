Return-Path: <linux-arm-msm+bounces-114302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mjv/AmqOO2rSZggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:59:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7C96BC619
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:59:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OQYxvD1L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bwRjJfLj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114302-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114302-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 072FD3009CE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEE238C2C6;
	Wed, 24 Jun 2026 07:59:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190C3988FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:59:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287975; cv=none; b=H2WVYLz/W1BUAQ2xU3ZnM7VT7bwgqhhHd0CjwdENEIfWpABKMh9ARxDs06ZYvukiyB45YJUAJ0dV1NfYWqM39jIQQyct6fC+6T1o2d2l/5a4i2OUJRiSLawB3LbTEt57rxTQcYOnihtVUT6XyoX6vmT4rvLnSniKNeCw/WYH2Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287975; c=relaxed/simple;
	bh=qvJ5lDTQaJZMW5WRgJaL7eHme5b7nd8yOh3zWqHbc/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Evg64a5y4zyYVDMup7Zo8OnuJ7db0LN7EHSRMoeJSkwal8ZmhVwd1YuX4l5WxcOHL8QWdeJBexG+1U17rMoELbzVRlJ4r7nGUy/PvPsSrxLBp8Mal+PFwm+NTKrYpU0hAvB7J4lXkA1+yoSwBeirB6Tj2vb4Pe8PhZxlH11NVPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQYxvD1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwRjJfLj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u5Tb1889403
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twOtasaax+oiBbZUugOt970FN/yZTZVHTjP7+CHD5oI=; b=OQYxvD1LrRMrDzqs
	E/G719eReGK8svK9gtOldcOCXhS4ATjw5+mhbp39TVCYmnwOx0zRIFTLVlrThCEE
	DDSyLNHRP3aFUlZ5ZyaSyWa7/hejDnrN7oOqJqxo7JL46O+0bV6dzdDnN0IgnEvi
	OuzJMbXqCc3kda5phMJkD0alyJ9adEeOp0NdASCcK0yVbLX6oyv7Fk8VE77tHG+/
	cUy4b5ROukraJt4iAkIvHar6YVIjycfwYqeZpXhKx7/btllEWrTIe99WRdtrMU8K
	koAyvanXwNWCdDmCvyCveE3EeQvafn9PSK5er5TwgIxiEb7hKP33s6YZbYwJuaup
	QJSuRQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3m15k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:59:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-920eff1439cso8258685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782287972; x=1782892772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twOtasaax+oiBbZUugOt970FN/yZTZVHTjP7+CHD5oI=;
        b=bwRjJfLj5MmQWsXhXVvlQKbBK4gDN9LymUq3/En/7X2U5A9nzrW/StZokiMlXZQp30
         MvZHopY9VPm8oxfhHdvU4da+DSiqfX2vLVpvqc0+y9dM4+JalbQV6cII4u+LDBQ+PvFe
         GMrMwSN0naMnQ1RaJJNrsA7Noay3Tp2T12B7hdpdyNuTEK8QWBKbQ/Ta6nKxI3cpuaeH
         xfFSD+k9Mvtuq7B7hk+nWtSHU/KuHTLFSa5SgAN5sm0iKSMQBQubnSBkhhkXSoVqtqW/
         SjMHwp83gh55r8wmnU66KakV+MpVuFVi2iDYjnlhZNd3SYgjD4ZIqp91HzCKHWqvO3lB
         kFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287972; x=1782892772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twOtasaax+oiBbZUugOt970FN/yZTZVHTjP7+CHD5oI=;
        b=O4yKhyjWDABwbtQ4j52sG+DQrWZQagJESDHF9trVs1qM1xo82p/XK0RxgA1MSMI+2w
         iNzuP+U/SrA1JLvvmm3DALjxdQyGY2h9b4qqILJDFXR3Sbj9jXv+w4mOFKiF9jz3waBT
         s1hiXZkykU788XHKLZn9wYmIOZPY5Sr6nuiHqzxaBVsQ4NG88DiXdM7J+VZ51viXDFOn
         88gxqoHmiDu931Wu2cA9jtjMmKq/NowwINrCXCOSbsP9wHfdw3/uGCtK6rwIjy9N6Gkr
         +pfc/kCnPjcdbd182l3fWVYSPQqlhp8yxq6wk7Ck6ZiuGwbvDQS0eyCqCKm+ic4n/amB
         SCKQ==
X-Gm-Message-State: AOJu0Yyop+aPsjRSdPtjeDgtHr+MP3pL6SJo967YMF2irgIq+jnm2dCt
	MLAN0x1sGWnmpJGNd7oI5HQsXSqmLmxnWOsvMWqU0EghDE88Tqt4yUyG4O8AcjnxQefCgdlPTcr
	8I7oHTqbzJ/RPgsk2quqrIVUfnDGU1UfHvrWoUw92uyje3QxmU41UORYgZH3AyLTEgwpD
X-Gm-Gg: AfdE7cmI2LLe6kxnQgKWN3YCaprxrtLMzB114clERcZPZXnY/0EsFbjt/R0gYF0F7up
	sPuHtw1Ezxe7mfS0cwoWjrpWsl9Pl/es436Gv7R5TtNi+GnTBrIg8JfwEonytAPbozUefwrs2FV
	ktGWs6VEABRutRrXzzSyoBdcJfbbXqKTncZDixAnh5OVCbg3N9RP9JBRgDTDrl9RPvYy0hcyk+Z
	j+FOoWE8Wz0FvSwyvoJyVZTjYmqgCRFjNSWS1Zf648hqm1HhatZfzflM4ttFH/eohXbd0tiVUb4
	p0JmI01R4ehKqoCjb/Pcwc3RgWfBYkXkqUM5dZJW4u8jVlnt15EhuxtZa3hnbYS06T1o8MwCHez
	myUZ9EyHiovxnlSnRmQOof7bEyP/wbf5Q+AQ=
X-Received: by 2002:a05:620a:414f:b0:916:1a60:ee05 with SMTP id af79cd13be357-925c335da65mr912240785a.0.1782287972586;
        Wed, 24 Jun 2026 00:59:32 -0700 (PDT)
X-Received: by 2002:a05:620a:414f:b0:916:1a60:ee05 with SMTP id af79cd13be357-925c335da65mr912237585a.0.1782287972149;
        Wed, 24 Jun 2026 00:59:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99e1aasm602084766b.25.2026.06.24.00.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:59:31 -0700 (PDT)
Message-ID: <f1fc8b08-721c-44e0-b7c0-e94d47a69158@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:59:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe
 M.2 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
 <20260622-v3-lemans-split-v3-2-d26bb22594e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-v3-lemans-split-v3-2-d26bb22594e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2NSBTYWx0ZWRfX7fUhYn/uS4JL
 EHh4C7s7Vde75sdhTiYcZklTM64osrrUHHdQF+vKm5VzeGtfml1mWoVXU9UiRgaSedNs/wAFG8D
 69rz7fltCwEGv7EXlZFBPoGXf1tOegc=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3b8e65 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=RHkSvrZ_EfxGpr5bUSgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HHJ7PSSzdgtSleE_U7RQXJRn193q5RWm
X-Proofpoint-GUID: HHJ7PSSzdgtSleE_U7RQXJRn193q5RWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2NSBTYWx0ZWRfX88gbMlU9/EKW
 thr3qZKXJBQzXPFdC4Kcbvmefld9Q+oHD8L7JrQWm8FgkB+OlGInvw5ZMm7YTVbVS07SeSpoGJF
 RB9WO5INkS+OqBrRsrzKFaNpdZbq7FUVIcXNYqZ1b3A1ckedzISQwbREZRbEKE+d2PFJTvQN/d2
 rBnI7OUBTaD8XQIAI99jwgMXR8Oy/GrJHT/mU+ot3NO8hrjWaSt+cY2lFP5FWWiww3Kw72nxxZI
 Kdu6NHGnaisGQy2Jo2Ad4jI46caAwGQWzdROSyq/hy7/BhRsDGuySKdJQ2fvu2JV+UjpBFwOAPY
 LYmh/3xbn+LSspSSii2J00KDChArEjxwEysMAS7uWLz7Zlpi4EH7RHvZnb08WU4jlDkyKpIbe7F
 XWzVxTMSbfuK4Y2TJ+v13ZnNhTmOnhXB1N6lh1xvsrOOOPzAVIXSfSn0zf7AbAEIk8FuAO/9h+a
 TWMffTicaLRkQf2t+Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114302-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E7C96BC619

On 6/22/26 8:41 AM, Wei Deng wrote:
> The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART17 nodes through graph port/endpoint.
> 
> The M.2 Key E connector is powered by a 3.3V fixed regulator
> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> (vreg_dcin_12v). Both regulators are always-on and are required by the
> pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart17 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART17 interface.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

