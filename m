Return-Path: <linux-arm-msm+bounces-108409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN3SBD0mDGoIXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:58:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4D857AAEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C2263003837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A2838F929;
	Tue, 19 May 2026 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8gZLpc1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3iGg22m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B63254A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180365; cv=none; b=iqtd9AM8BGAFxvHtpC4HvbYegxdJhL6svEkxWdC7mHcXYCCqbJjDm99Q84AQDc2U8iJkbmKdmJb4tlUUczL8odCyuLi0FpV8JRS5gf8OoNs+brSy5izIu4zVS8FSNLMJG5+o2uEK+45ogLj5uaquGzY5c+LJDxmuJq7KRQEK35Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180365; c=relaxed/simple;
	bh=OEl61ww1EIDsUXnfEJLr0MXLhW2s7uCHQdmHmvR1q6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfEW8/MGc2rHd1UlwEaGQUJqlXbL7PkTqn2P6zazPFANmBM0HW30+jlGAiNDn93IbmbrYiL0RhdZClAGiszZaAkuYc2yxOamBaB/db3GM7CZMAdUhL0E5QN068fqlJo2RrGNdJ1W93DS+Q/iFopNt2KlrxG4yxCJR1A399Se0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8gZLpc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3iGg22m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J48WrZ2482392
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=szcEXKpDrn/zTAbhtKTmLyoC
	PTVBT+h8OXGfNym8y88=; b=B8gZLpc1F611FgikQyyw0BWfaHYaPo66KRLdeW1a
	h83QEn9smzTZ1myJ5KAyCPlCcGetqowT0AvEn+mGMqFrxlpmMX8EOfBZG/3ZQtkk
	XsLn9QvuMHrfn5adKdNWjwuq/3oKC4Dza0+69Toy/rs39HlNLV3LWai8Z89g7wYj
	nyjwOFLgZJwo3+vcqDxRo2gxGHbqBcxBrJVgN+UAxsWJntf1Ysl+LGmGX6km1LxQ
	I/I0Ohz1rv7rKco+40poDUiPYlH/4FKxfYR+t+hIqyo9jWh1qso0+TZLSQ+WEaf7
	j+5uwnwht20+y8X/krX5Xpa7YaIJxYBfxQl8KGG4bla47g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvmc1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:46:02 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-135de949041so338168c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180362; x=1779785162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=szcEXKpDrn/zTAbhtKTmLyoCPTVBT+h8OXGfNym8y88=;
        b=S3iGg22mkKs731b1uvtAX60Z5WO4kZiWj52KhqFyyB9bg4z9ppxYH062rU0eLiq83B
         ifmKNxfoH68b8dIMLLYoLuo9dsDL4KF0d7AhuJCpvqMhZe789Hz//zo98tv18j0fTrif
         9ED5iH4sT8fBDrab3n8xv8AHrFnJGxELcf4MLS1Wc+fGnKxB9lkdVJdGfxLp95lUyp88
         u+Sg3jZWrSDsYcca1umBtHgivBeLpL5aBHMHhvwxwVFaUtokSA2CBpXlPHKVsvQfxIdi
         WV08WQAVhwzVmCmzs/R6h6ComOL7Li04EkITDpGRfmF73SBLqzGKR7H3V/mK38/6+c6L
         y1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180362; x=1779785162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szcEXKpDrn/zTAbhtKTmLyoCPTVBT+h8OXGfNym8y88=;
        b=rRR+WtwgyJp20H9cDStjQW7JW/smfYTr6CFJS9SrdMuQFZ2KRnjV1h80Mv3L0PB+A5
         W1bxRAbVlE898o6VE8f/RPbiyb+YIj8FHmZuzAtf8dxCsEzQ/mnKk1JQeI/bXT3iF+Rr
         wA++Wv5htBCbk4k/2FlGbLL3NShZC2XDKi34ah+sf5WvqjYnV1HJR00keEh2pUoU7eyY
         3+odFAq7Op/VcO2sd4eGbjTqrhl5txoaBUqNlznJrjciH8+0ruMkfS5bD2t5H1zew3RK
         U34GmYykKnU+PBtYUEIZhULCpTxFUYjF2OAX3fCS/nyf66UaYYohQT3lvyCNLyX949rD
         PFBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8esZx59AI7E5/cwAkpnnwpqKFkFj01Pj1XxNEjA8TxvrpX450IUj9wPeXn0F1i8ArA0vxcNZtiQHmKzKuX@vger.kernel.org
X-Gm-Message-State: AOJu0YweKqrNEq6iVZr2YC/Z0vJirqoDDT//U0JGYLHijVPMqwmxeqWG
	yB2i8GKpF7YUTaLt4PIKusUvpgxeH+ohTEKYLMT5uy7qedakX63twDGRAJ/39jHBe79Mgky/7mH
	9JYfnsyIsi0Jj8Mg0u3SIE4AmgZUobyCEFot4EcsMquAbmJDnXqyqjDs+7TfO4rVrUfbJ
X-Gm-Gg: Acq92OFpkTu8D3e/5mD6GFNpmN5zI9onCo8F3Lj4UyS4bJ3+ztuOlKCYbqobE/axBXi
	QAT1TU0JvMpg8hU+SkE0nf8PdeVo2jNnNzYFm37iCAvbqg/Aam3K38JPvJuway82Sxp/dI923Af
	DNkvmUJpmA3oHPCeZ2nTIKno3e9lLM7XkhrpQmnyXo2yCMmPNbOUsO6JJqy/m7VLcKdU9o7dZmY
	+PYOfh3fkqCaPPgual0lu9XeEBf3+M7BBBb3uCOE6F09PNUOU7wzJOEfv3vWzk6n7cyyZApWIxw
	kBJb66DshvWrV5PBC+WlfRjMnlTOt6KIm3gbfM3ZNlUyQkjMQQlup566/A9vaE4rINY93yWY+ne
	2mV1hOB6Tlo46/dThW8WJ7rxSJnYec5VUbebgSWacZDDqI7gjAWHCqZ7mal3uaOaW
X-Received: by 2002:a05:7022:220f:b0:12d:b8e5:5d6 with SMTP id a92af1059eb24-13505434ad5mr6710306c88.24.1779180361540;
        Tue, 19 May 2026 01:46:01 -0700 (PDT)
X-Received: by 2002:a05:7022:220f:b0:12d:b8e5:5d6 with SMTP id a92af1059eb24-13505434ad5mr6710270c88.24.1779180360866;
        Tue, 19 May 2026 01:46:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ed3sm22526606c88.1.2026.05.19.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:46:00 -0700 (PDT)
Date: Tue, 19 May 2026 16:45:51 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <agwjP2YNVeVtcYB3@QCOM-aGQu4IUr3Y>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-3-cf5d0e194b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-knp-soccp-v6-3-cf5d0e194b5f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NCBTYWx0ZWRfX7TmvMiK7sPwd
 Faolh9q7tRy7uiMAG2/PhWrvio8QpdpA1pif/KAYT72UA6BiX0smXDeRB3K0tDYfuFxF6Gf7Dl8
 hY6K09/Ymrc9SR+1J/rrj0NU6GY9CgY/5CegTTb7kOXfZ1oXVKMhY8jU4gumxWWiWrW4TbZomjv
 DuKXBGRy1TH6hWIy+Qjn6U2wNxeudueJtPQg1y8Ciq3FAKlr/dl/YDe+6TaQCd10riNi9wguX5o
 ZyW4gSWPZIHSOphyYnMMvfltsLbekP7GKCQujA6oCeS43AFHVUbyKxVoHwNiW/QmTqCTPE42fsB
 eC90j9Y6rIJfcJ7jhBEUqCXLrADKi2Kf75hNzXv5HFzRFFzoyH+vg+zZjLiYOY0z75IkCYb4WYX
 4VclAKdWxKI6qvm5rBwzIzsTHy8t4IPwvhAKSJDKzES6PTgmSC56KUtOqy503sWaz09NvQq8lhY
 xVce+8Mdv5AD1Ac9ZjA==
X-Proofpoint-GUID: HyGEXOWiH6JQgU6ylqVgjCl0aJvaFr4_
X-Proofpoint-ORIG-GUID: HyGEXOWiH6JQgU6ylqVgjCl0aJvaFr4_
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0c234a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4OVIVKNPbq5Oz00rPZ8A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190084
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108409-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C4D857AAEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:24:21AM -0700, Jingyi Wang wrote:
> Document the component used to boot SoCCP on Kaanapali SoC and add
> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common
> and add maxItems constraints for SMEM properties in the documents
> that reference to pas-common.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   8 ++
>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
>  .../bindings/remoteproc/qcom,milos-pas.yaml        |   8 ++
>  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
>  .../bindings/remoteproc/qcom,qcs404-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |   8 ++
>  .../bindings/remoteproc/qcom,sc7180-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |   8 ++
>  .../bindings/remoteproc/qcom,sdx55-pas.yaml        |   8 ++
>  .../bindings/remoteproc/qcom,sm6115-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sm6350-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sm6375-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sm8150-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sm8350-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml       |   8 ++
>  15 files changed, 263 insertions(+), 1 deletion(-)
...
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index dc5a9981c12c..e81ef400555a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -46,13 +46,17 @@ properties:
>    qcom,smem-states:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: States used by the AP to signal the Hexagon core
> +    minItems: 1
>      items:
> -      - description: Stop the modem
> +      - description: Stop the remoteproc
> +      - description: ping the remoteproc

Just a heads-up for Bjorn, this will have a conflict with Rob's phandle-array
change[1] on linux-next.

Shawn

[1] https://lore.kernel.org/all/20260507201749.2605365-1-robh@kernel.org/

>  
>    qcom,smem-state-names:
>      description: The names of the state bits used for SMP2P output
> +    minItems: 1
>      items:
>        - const: stop
> +      - const: ping
>  
>    smd-edge:
>      $ref: /schemas/remoteproc/qcom,smd-edge.yaml#

