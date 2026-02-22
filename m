Return-Path: <linux-arm-msm+bounces-93553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id s+CAOLzHmmm0iwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 10:09:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2495E16EC2C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 10:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D8D230131CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 09:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F2E1E5702;
	Sun, 22 Feb 2026 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcHVWlbZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAibYHXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D100E194AD7
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771751352; cv=none; b=eyEWvUDxhxOr9JZwVpzsJaG/GwHXJ4ateqTuY9Db1aQi4zdaV8s3hsfjwNLApoMV54YwPkm1CnXGGRoBIJqQIm7y2wJEegCMOwU+0cgzZNy5W1mr58s6BgWK+DpKJeoRpaJORcUMA6BDXa7aC+tFnqs1TD+fqzK2/AHMIF+CFKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771751352; c=relaxed/simple;
	bh=z7v9zbZfAvtSPyUpOo++ICh1JWY103m7kvneLVdlNdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exoSXmRdjZ3vF8hBoFMtvNyBqGd8yOSp+lb2FtUGTUf687B8Xhv/Y8sqPUwi/qyk6jKIdeo9hCo8gURBl44sW+1+d34LPrLSbIK8wTwhiGT+FsBqfkb8K0wgP14BMsUiwriWdudpr3/kPmvNeFUfKjfIFpFE6pY9irtElnKwH8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcHVWlbZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAibYHXq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61LNHDIe3370457
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 09:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KXrz/whAUdxYsVufWRSV8exud1gQ6s3p689ErTtFlQ=; b=XcHVWlbZU0K8zUxP
	2qAzTvLvlt+IZVWK4Pvgo3/S3a5QMnyjfsrX1Wh56ybQRVBr6hW2BULco4mWuGNG
	YZ4xDYOpy1To3OqxS8z3wW+z3/kAh6HNg1BaPoC4rvRKRmVJygzTWUfJjuqO6SDz
	RmVWrjXZW6GpXZFd3f+xt/NJ1IAUa9JCz7zbhlelAMssOxjDQFnzc2EHxSas5i4t
	eoY/ox8Bz56XJmePBgvFTG0koBXuzqKKxdcVtP39l7ZVcez2YzZ3N2FQVZY18SXg
	SLmJpVnywamN2qecco4rRAH/EEJcKHCj53yhHSVHxdBrbdF8cw0HYBfBKNqGd0hG
	26Dxgw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wba07v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 09:09:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb5359e9d3so3374806385a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 01:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771751349; x=1772356149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KXrz/whAUdxYsVufWRSV8exud1gQ6s3p689ErTtFlQ=;
        b=CAibYHXq7rXedA4pLnZ6C54u6vzBbplhRyrCqhLu47BOtBGTGG4jSQLnxUsBSLyE7d
         t2rKuco48vxn2jUHxfvMqCgYkTBfyIJgAs7CPbpH3OZ7U1SO22XagbKpRva12Vv49eOt
         OGIu0eZ3imKRNKRuQ3fnyUvjWYuLEJ9g7dkwtgbdkW8yD/5nwWHp0k93hAZyom2rZu0Q
         dmswAbXWwscWBl+3tbYdruYn/0W7kgfjkZDorkTwmKWASl91CnYBzj/3KUDUmfKlrB/c
         uHGSEGAcoLbUYnZ+fuKZFSoAjLPDR/dR0bLXfNuJRaE1lKfERu5z1SdjhQedtwn65r1z
         Qcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771751349; x=1772356149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KXrz/whAUdxYsVufWRSV8exud1gQ6s3p689ErTtFlQ=;
        b=UyC6N1ZLqQiF99lipcPuGxCyCeAM73zitjWmKpar7KJwDzfG+VQ8Sc4ORhWLdu0rd4
         w/yJsihTINaoVbAmoaFEI7ufveDjkDqDeumw1GG9rRPWIuThbJOgiR1YI79XBlVD1z04
         iyogwCbPKbS8Nf7RmeIbO66luijDp6zD5fLvnoFUJirJvHq3pPbfSjuml6imX/lt5Sx7
         69ee+HWTORSRCzp+AQbD9N1BfZrQzQXsT/IEtGGpS8/AV7MWUMAFHQG032HOwo/yWT8l
         fZyGMRGbVH0oYgYaX+fTkgxVNlgxWNbow6TxtCCP5Ep/3FU7m0x9pR2HaGkfTHtMG3P7
         mXqg==
X-Forwarded-Encrypted: i=1; AJvYcCXCsV293Uix6cZRBAlcj8coZkyxEoJmGOqHWe+f5mLS6O7KWVKlCDUDZDUKyjdV3BJpNTZeuf7I3fCE5HZt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3PvvkIeOlGKjuU0q/TWPWlO1wiq4hqF1IYrgZn5bzTxob8rkp
	hvM6dnPnzxln496w8g6k0skYeJ85Wwz+OuPD9R/qvbW0Z1v/ytb9EdJQ1loKbvs+FLqUhSYC/65
	YQzW7+utm7PKQXqbDB1Whk335ymIrJXJwGgnGPtwnBAYX6S4j4MvWvUTMyqQuOsplOWOz
X-Gm-Gg: AZuq6aI/q7cElQLtVxaknkNHoQYnSa6R0L6A7tlhfcNEiK/o9PkCDGiR0BxQsot/YIn
	J52FHLQPiftY6PIlsspH6j7GsX/lpFkvisKbQyDkkwSJUfmqHdcI5cmDIDRxY+mPpZ9+hSPwQUG
	zie1jgSC+ZBQq4tJPS7WuUttTGwAOOE1cEpIakHok7vatKHzWBcuG/rjVch8xFeTeXo9YxCZvXP
	YA7oMe3P3fjzi3YYyHIuS+Uxt3bzrmcS8eLLkFmKKC5XyddR/mRbd7VWMisGIi4L+/Zp9Y+3aaF
	5Gq/kIlR0dVZ8lIuTlsSd6dS38UJgpzg+fLLfetWKNGp+iFBJhTSVAMMLpAVL1WdU7tXNcVOakD
	OrAbw6+VJ6CuTuZVJay5uzDYyFddgof/Og6TdZ+kC4Zq1aJw5
X-Received: by 2002:a05:620a:29d1:b0:8c7:1156:efd8 with SMTP id af79cd13be357-8cb8ca0e734mr611754085a.29.1771751349069;
        Sun, 22 Feb 2026 01:09:09 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c7:1156:efd8 with SMTP id af79cd13be357-8cb8ca0e734mr611753485a.29.1771751348587;
        Sun, 22 Feb 2026 01:09:08 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43970d54a68sm11491393f8f.39.2026.02.22.01.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 01:09:07 -0800 (PST)
Message-ID: <a814c0bf-e421-4cf2-8b9b-e5dac9b80dff@oss.qualcomm.com>
Date: Sun, 22 Feb 2026 09:09:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] soundwire: qcom: deprecate qcom,din/out-ports
To: Luca Weiss <luca.weiss@fairphone.com>, robh@kernel.org, krzk+dt@kernel.org,
        vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com>
 <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I54fqyCdebIrBQR_9MTqs1Go1RaGuZ87
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699ac7b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=WCuOT8F2V25LyjQZ8KwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: I54fqyCdebIrBQR_9MTqs1Go1RaGuZ87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDA4NiBTYWx0ZWRfXzqvnC9rTk1dl
 kGXrn6xIJQXeK46GzCJUHWZpfEMtacC8sIqw4etDAVXWUZt5GSSVhGtSOmD/ANMSCQvY9aEkIWn
 Xd8+V1h2mAHX/1PZ6DOIK7B3tyWYzyoxWhSF5IIWdzX9af2JU4cMzNud+rsw9Z8+qLBYWbv3Hm/
 /UyJ0EzDnlp2mJh9+Qq8h9dCiP6SV6LphGP7xjbWj4gt6bk/SsBM4g2zrJ6XUtcwto1KsiqWcF0
 YeWwzrQHHLOZtGP9c9NCng192S/r7RaEtPOHP5kqlQSXL1ygz26lQH5s+j3m/X9eMxhzYEfP0T5
 gx98JjEXr/x/EYd9OGSa7xOnx6n7BVSFAEHOnXjcdVvcRQhWKRS6o10aNqsSIb8GorGjf1C3KpN
 mHDNZm7nKIQVRtO4NILhOsfMQSqSGm2ryKuIoZ1QZ5TttFLcpMtLv1J6kaMGWFiIKNrfr5hJHrT
 fJPsLapl4pBdnojnMcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93553-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2495E16EC2C
X-Rspamd-Action: no action

On 2/20/26 1:34 PM, Luca Weiss wrote:
> Hi Srinivas,
> 
> On Fri Sep 12, 2025 at 10:32 AM CEST, Srinivas Kandagatla wrote:
>> Number of input and output ports can be dynamically read from the
>> controller registers, getting this value from Device Tree is redundant
>> and potentially lead to bugs.
>>
>> Remove the code parsing this property along with marking this as
>> deprecated in device tree bindings.
> 
> Could you help suggest how to correct kodiak.dtsi?
> 

This needs fixing in kodiak.dtsi, for somereason the dtsi is trying to
add ports that does not clearly reflect the actual hardware.

--srini

> I'm seeing these warnings on QCM6490:
> 
> [   36.952517] qcom-soundwire 3210000.soundwire: din-ports (0) mismatch with controller (1)
> [   36.952524] qcom-soundwire 3210000.soundwire: dout-ports (5) mismatch with controller (6)
> [   36.954285] qcom-soundwire 3230000.soundwire: din-ports (3) mismatch with controller (4)


