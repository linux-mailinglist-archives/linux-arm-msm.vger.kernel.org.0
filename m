Return-Path: <linux-arm-msm+bounces-109709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN8aDW8dFWocSwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 06:11:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF215D097C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 06:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CE6F300AC90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 04:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD843BCD2F;
	Tue, 26 May 2026 04:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ol5aOili";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYEfBqe6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641763BE630
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779768677; cv=none; b=NS7cjDR7O62ZAM5Ky9ZLb6BarENs786QR3raWQAM1Fi5+buRT5JaY6MYXiFD84/YaHdrE6QIG1i6l3M30OL1DAsYYUUNkpN+uZ3KWOT6Yxh6cWUjuxMpQlU8tuGoDDzNQKaT7PcQFuIhV6a0rZNMLMFHPguWENtIh/ms2EVYCZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779768677; c=relaxed/simple;
	bh=zg2+q2fDT0NKL9NZjoGAUuEpoErO3sAmmrz8TWEM2yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4IJXp40DZ4X9ncX3zYw2hwuaCb+91NohV9zd2esT8nk/r9vF1K678gaXpXqxniTZwGDQJJ+pK+3DB6FE5CAni0po38Wahp4ZaHZVRkMwcEliPUCWTQtIXrqKQpOBuY6VTv/y8a/slTCnVWufFOY/VAhwAq+erTazlAdts4XGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ol5aOili; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYEfBqe6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PKtQJP1580322
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sL5l3pfFXSzJMIu2H6ZykjeOR1JERjmI6jvuOGjE9Y=; b=ol5aOiliKX4CIpur
	AvHHSfn8HfkhZjqAyPt/BOPHC2/+w54ByxR1tXZrMK16T6Un+9pfxQHHPiZIAQjJ
	IX5vzq5xFZgZQb/M5KiuN+57N1utMm+DL+sVA74PpyBCiNBVnOcZKuoqgPYYR+gN
	cVW5qyvJnpiSBb6Pj7djyGK1xUU2RNvzssRic3PeHCWoyd9pVv+WvgqBAmPcmSE5
	6JJSm76fkKuoMHEITuL4XdWpaMVGAPR1XArCrUd3vUpQwFVRQk4PF22DufpaWPF4
	Nnct608bVFoJRIYrFvUPTl6j88bOh522/W3qJVRJ/FIuesgZuiq2ihCMXaiOPwRL
	E6b85Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmaavng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:11:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso20138249a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 21:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779768659; x=1780373459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5sL5l3pfFXSzJMIu2H6ZykjeOR1JERjmI6jvuOGjE9Y=;
        b=cYEfBqe6IghNvXaGKOjTTB+h/jnM93VlcBPvkJ/NGS+cmDOWCv7ZNJKpHExjxLgQpz
         wGRqaV2RKHEiyclRBh8gCKN/319WysLXf3aYwi06f236VNCFCW6sMUMfr0xbgpxzDoIn
         Kubl2Srx0+VzmGOupAe/ojshlGlJeyMKJD+oQsWWfJt5qNXvoXnJZsXGlBSZEabx2f8g
         7+auILrGOGUagxeiG2wbQkAmTCT5E4vRoQwB6W81CGwSROpGP48oz64jbJ6Bjb9GIwPI
         VkMTdC7mMyce2890FJtiWakYcx+UDyIbDcTI1c3PPesLAlJ6pxSdbPeqjqR0rM7ZbT7P
         15EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779768659; x=1780373459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sL5l3pfFXSzJMIu2H6ZykjeOR1JERjmI6jvuOGjE9Y=;
        b=EMP1Ykwffl8rShwxOKoHeKNkJ8j+JGUFLPL+UemyJFFMN4E5FhVmnK5ma4SKkjoS0v
         2jiO/uLQFBb+3WRwJ8XaV9um7lzHWKW/7Gy6g/fsXUTM5cgjWdb0k8fkFTWdfCR+jXBL
         gLjGTKd51D2AJgDqLr3We9ijXaHcl21ECziPz3JufvO3b3QXqtv9UI9VxSrwrEYxyVo6
         enUQ/+zC1GSxtV8kENqmZjfNoNP7dMh9wtcVSbNAqFbepfizIl4zLzTzxxVHCdLeWTER
         lNqodrKoLl0DWO19SfHEzGKP0t/USvTzc4fl6MMa+/hRc+vOzKb8mikJNSHNWuQOjz62
         Plxg==
X-Gm-Message-State: AOJu0YycMB0Eahs0iMyWvDmCLy6QugM1P7UoD8njCIyNN8Lj4rOTrkws
	PMaKQN4kynj+hXyt4/UdTV/gdTgGAdiUZ6DTnN5gEO5EGiQ7s3oerXuHKVdvikkxJs1bqPA9Ron
	gPtLYglh/Pzc+nwcY6dTOk/1JYXRTW4mnChchWpL4QZuWtD82rQy6a6lE2Vv52oIDZycG
X-Gm-Gg: Acq92OHl3vrBeFx8beb36p6LN0lLN+YmjMv9Punj+3SJVr2pDKJBCKU4LAUNdMEaAVy
	Rjhh671+JKKwxGGJyMR45HKPd7uEOb4tVbKrp/wUvZKJaFI1vEMif0smvv1SbbsXDNSjAxMu332
	zPWiGcGpE/UralP4HvtRYVBT7F0gXURnRrVyalwC9HtgeNbwYTiB7QEHdBHT+siJGPiSgrff9fn
	ScOZLHKA0sZAg1bAFkrvE9Y2FB0JRrtZz0YDWnsCrOSXHcYmIsS5O0zepBNHNjcFuPMtzJ73FJT
	yfAZxmR+RM/Qgjh1mbZG0JFpICKizN95W8a84UBcYYfLZrS/PPiby0prdhrYsJi0qM8X/gwrzcH
	l6I6vQkDSNQaFwNPNhYItO+8sgnwYDIU6bNZc+Qq+y5mQqDuFvrEeGRfCdnOsFaEkgw==
X-Received: by 2002:a17:90b:3791:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-36aa16b66bemr7246988a91.7.1779768659406;
        Mon, 25 May 2026 21:10:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3791:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-36aa16b66bemr7246971a91.7.1779768658884;
        Mon, 25 May 2026 21:10:58 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7b92sm10942268a91.12.2026.05.25.21.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 21:10:58 -0700 (PDT)
Message-ID: <51fb3abd-998c-45a8-a058-ab9185d6fd7f@oss.qualcomm.com>
Date: Tue, 26 May 2026 09:40:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document IPQ5210
 watchdog
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a151d54 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rzHiTKIQvxCi1bN1TVsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: _LwBGY6ScyAETN5x4YNdMTVNmB7-sNfy
X-Proofpoint-GUID: _LwBGY6ScyAETN5x4YNdMTVNmB7-sNfy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAzMyBTYWx0ZWRfXw01QGMDxGDJF
 0fsdfoNSIFWKJ94gTnbMdoGbRTrtQicMxWzgYYqydH9rTiOJE1DjAzzjzzt2/5v+jFj7ve/QZT6
 lDIr1cqjjvGUHVUTTsSuWwForyluroeu3u+wn3E46iVisVd8bTMi1vXyPFSh68UPmW2/sbY368f
 EJIRQCWU16eaa4n1HizmscOjrjsXeRawEi16RsbcR/Ct25pcWOeCqD8739nV+DuzUY+oNwGLHRQ
 iQjYSoLLmxc6N+D72oGFE+CADZ6bh5ddrJBrSKBDlMIXJ9cGeuFd+7fY8NnFEyQpgDbCzByX82x
 W+n18j75G6+hyzrAnWXxVP/DcKG8e+IVPqpSoyln7XH2uKuuSNjsecKlViAtXZ19ScnTDLao2DC
 OxntfegmqfHY/to+pD13Bsa/99QNUluJHNWTZ+Aut69QrCybBYqbPBtejNco+CLyRxyDtpaNOI6
 YNByoLR/bPg4qCDIubw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260033
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.0:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109709-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBF215D097C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/11/2026 4:19 PM, Kathiravan Thirumoorthy wrote:
> Document the watchdog device found on the Qualcomm IPQ5210 SoC.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 9f861045b71e..21f6f7db7f96 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -20,6 +20,7 @@ properties:
>                 - qcom,apss-wdt-glymur
>                 - qcom,kpss-wdt-ipq4019
>                 - qcom,apss-wdt-ipq5018
> +              - qcom,apss-wdt-ipq5210
>                 - qcom,apss-wdt-ipq5332
>                 - qcom,apss-wdt-ipq5424
>                 - qcom,apss-wdt-ipq9574


Guenter,

Could you please pick up this change? The watchdog device node addition 
merged in linux-next[1] is triggering the DT binding error below.

   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTC [C] arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb
/local/mnt/workspace/kathirav/upstream/linux-next/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: 
watchdog@b017000 (qcom,apss-wdt-ipq5210): compatible: 'oneOf' 
conditional failed, one must be fixed:
         ['qcom,apss-wdt-ipq5210', 'qcom,kpss-wdt'] is too long
         ['qcom,apss-wdt-ipq5210', 'qcom,kpss-wdt'] is too short
         'qcom,apss-wdt-ipq5210' is not one of ['qcom,apss-wdt-glymur', 
'qcom,apss-wdt-hawi', 'qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 
'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq5424', 
'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-ipq9650', 
'qcom,apss-wdt-kaanapali', 'qcom,apss-wdt-msm8226', 
'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-nord', 
'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-qcs615', 
'qcom,apss-wdt-qcs8300', 'qcom,apss-wdt-sa8255p', 
'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 
'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 
'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 
'qcom,apss-wdt-shikra', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 
'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250', 'qcom,apss-wdt-x1e80100']
         'qcom,kpss-wdt' was expected
         'qcom,scss-timer' was expected
         'qcom,apss-wdt-ipq5210' is not one of ['qcom,kpss-wdt-apq8064', 
'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
         'qcom,msm-timer' was expected
         'qcom,kpss-timer' was expected
         from schema $id: 
http://devicetree.org/schemas/watchdog/qcom-wdt.yaml
arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: /soc@0/watchdog@b017000: 
failed to match any schema with compatible: ['qcom,apss-wdt-ipq5210', 
'qcom,kpss-wdt']

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/qcom/ipq5210.dtsi?id=7a473107f9785700a5c57cee69f60c19a9703f95

>
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260511-ipq5210_wdt_binding-9f77d959a28b
>
> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>

