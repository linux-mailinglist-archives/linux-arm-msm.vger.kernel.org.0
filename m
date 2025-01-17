Return-Path: <linux-arm-msm+bounces-45388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D6A14BAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 09:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 493FB160CCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 08:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1131F9410;
	Fri, 17 Jan 2025 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2nnZb/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354361F91E8
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737104243; cv=none; b=vF/JVxlM5l0nhVFQrNqd1aflqRsSyC/lbF6/sY0QPktrkeEEzGN3RLEMacabxBQM6khTk8MF79I3kGvWixUKveV5rf7KrqrBIKK0FHuygWjUI+cj/j44uLLz4kiIFj9b/OEltkEKiMc8fq9+IauLRsrLaAg9w+xjA4kGm2iGVAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737104243; c=relaxed/simple;
	bh=b3iyYpnYMxMMZ3OKqr8MtxaQA/kUOhijCioGVraPj8w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rP+nuPHcD7QXRtzVFf6+2Fz/DW7LE0QRP33YzF5SgAvn30b5zuXBTQXnTJmjCg+/tV+/iPMjyfbRaDg11nOZBZfcqtYXQg6YZn4sNt91LqtOq7Wzagbt8NHVVy1nlcEGk8HzScpUeCnSN5SBsyFLGHUaeJZSnjg+WcOFGnsHxs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2nnZb/l; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436281c8a38so11830615e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 00:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737104239; x=1737709039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3XiXe6l9/JbVc56Uje/zvEzl/X037G0WezfuvNdb7o=;
        b=q2nnZb/lWluv30EhQOo63689Pzal4qm+xmeu3uPU277vQiK5xap8DVCKKeGOtpndUZ
         lftFAmKPpikoN/jwTjK6GCbY5u9/BqSCsjLKJZP4rXE4BschuFOOQqAIpBlKzoHc1JPc
         XTFTPj94YKDWEYh5zBLH++LJlylY0NviVmirTWI+svdqG1ruPCG0jDk7fYSMx5eoS8Zt
         oLejB6WRPhhBwQwIvIRD8u/B6MNNPW8Fu1PYvukkiEHlrvbYJTCBTAeqtKkPkcmaW3Zh
         vfv5l8WFAkGk/Jr/gAVNGwBoPvoUkuCG2hjKsdIqwOoCnLAfBJ5Lq4IjACbT+NK4PPEf
         CanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737104239; x=1737709039;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H3XiXe6l9/JbVc56Uje/zvEzl/X037G0WezfuvNdb7o=;
        b=lLuJYaYmjmVmcl5eS/+V2haW2XgfNIUfdpStRq5t/ObWHYkFxfiz3BwPIDX6GZpZHs
         SMk+4xX5k0X8U2pE5kSGFienlHfxfLTbRJ7eFDYILdWFIEF8sJglDnwwYmbswtwukWcp
         fNJh8u9ARDiC3k9cJteZtcayXx7RJyu8lUC5sff4Fcam23iOFUZGHC9NNpy9h4jY3PTC
         B3Gkg+FkvuRyUa4kZwHt3TS28j3y28JnzYsnMBB45uZa0wDU+chh1nuQQoKCyot97wF5
         FRzwJk0NkCkHOsXHsh43sbeNTGNFbouG90LuJohV/ziVljehktTlg/2uu6vOG9F33a/8
         Mf8g==
X-Forwarded-Encrypted: i=1; AJvYcCXt6MFzWNvS3eI2X2O8rnaPJEDHS26tU75KkVC22FQoHE6kve2aAOPrcC3tkRb5ywI3OKdB9dk+I+nH5OZl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ONRdy06goQZPkW+NY+tzRCVIltgcSPNLOsiEuUwt+oLLSKXp
	10Y2G+FOmzzZcRI1InvRGt/T9nExBkmlVnGwUrFf6wMeiXgzI09Wo11uf/Pwiiw=
X-Gm-Gg: ASbGnctPpl/H+FEG0ljkKgymLfmX8nxGZvtht7grIjuTGUx7Eq29Z+ZgTro8o48ROeJ
	IsDlNbka+3HsBbib/nxE/qMMH3Stb4iycfYxTEUfd4y8NzM3uILl8wLpxM0b2tPoyEB6CqI8mOl
	ws1hlfhP/e8kPYUzej16epM0t8XEEQ09kmzmOI1qCoHjnPI/XGA3O+v4N3cu745ckB/XgWcl3Np
	Kc0HQE42CFoeOleiGSDKuaJa8pqsp/D/ApwgZ5wX9v8TB9YpVuTyFKYcHeUtUpoQ7pM7Z/6E9pz
	vLdK8UZ1abgmAQ6ngPWuiT1jKJvn0Sg=
X-Google-Smtp-Source: AGHT+IEWHGJpFxq2jBvxStHxeAKeZTttCF0yqHC5TQLcrG/JKmWyrwy2/yyhjx6FOkUPXSOAJYRnWA==
X-Received: by 2002:a5d:64a1:0:b0:385:e8dd:b143 with SMTP id ffacd0b85a97d-38bf56627d7mr1281521f8f.19.1737104239522;
        Fri, 17 Jan 2025 00:57:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2964:937:5d70:8d78? ([2a01:e0a:982:cbb0:2964:937:5d70:8d78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890408a66sm26680945e9.5.2025.01.17.00.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 00:57:18 -0800 (PST)
Message-ID: <6cf4c8c5-1428-42f1-969b-495b579360d1@linaro.org>
Date: Fri, 17 Jan 2025 09:57:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4] arm64: dts: qcom: Add coresight node for SM8650
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250107-sm8650-cs-dt-v4-1-2113b18754ea@quicinc.com>
 <be7b0acc-495b-4bb6-91e1-5db8e301503d@linaro.org>
 <28eec718-2950-40b5-b5b7-b4ecb5699a6b@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <28eec718-2950-40b5-b5b7-b4ecb5699a6b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/01/2025 09:20, Yuanfang Zhang wrote:
> 
> 
> On 1/16/2025 11:57 PM, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 07/01/2025 09:48, Yuanfang Zhang wrote:
>>> Add coresight components: Funnel, ETE and ETF for SM8650.
>>>
>>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>> ---
>>> Changes in v4:
>>> - Re-sort these nodes by address.
>>> - Link to v3: https://lore.kernel.org/r/20250103-sm8650-cs-dt-v3-1-759a3f6a3cc8@quicinc.com
>>>
>>> Changes in v3:
>>> - Move ete0 and funnel-ete to /.
>>> - Update coding style.
>>> - Link to v2: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com
>>>
>>> Changes in v2:
>>> - Update compatible for funnel and etf.
>>> - remove unnecessary property: reg-names and arm,primecell-periphid.
>>> - Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
>>> ---
>>>    arch/arm64/boot/dts/qcom/sm8650.dtsi | 166 +++++++++++++++++++++++++++++++++++
>>>    1 file changed, 166 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> index 25e47505adcb790d09f1d2726386438487255824..49d6567fbd2e68b66b517d8d9180c7443f8bf611 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> @@ -365,6 +365,40 @@ cluster_sleep_1: cluster-sleep-1 {
>>>            };
>>>        };
>>>    +    ete0 {
>>> +        compatible = "arm,embedded-trace-extension";
>>> +
>>> +        cpu = <&cpu0>;
>>> +
>>> +        out-ports {
>>> +            port {
>>> +                ete0_out_funnel_ete: endpoint {
>>> +                    remote-endpoint = <&funnel_ete_in_ete0>;
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>
>> Why only the cpu0 ete has been added ?
>>
>> And why are the other components (TPDA, TPDM, STM, CTI...) missing ?
>>
>> Neil
>>
> At present, only ete0 is used, and other components can be added later if need.


Hmm, ok so I added the other CPUs and I was able to trace on all cpus, so I was wondering why
at least those were not added because having only ete0 declared is quite useless.

=============><===========================================================
+	ete1 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu1>;
+
+		out-ports {
+			port {
+				ete1_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete1>;
+				};
+			};
+		};
+	};
+
+	ete2 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu2>;
+
+		out-ports {
+			port {
+				ete2_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete2>;
+				};
+			};
+		};
+	};
+
+	ete3 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu3>;
+
+		out-ports {
+			port {
+				ete3_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete3>;
+				};
+			};
+		};
+	};
+
+	ete4 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu4>;
+
+		out-ports {
+			port {
+				ete4_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete4>;
+				};
+			};
+		};
+	};
+
+	ete5 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu5>;
+
+		out-ports {
+			port {
+				ete5_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete5>;
+				};
+			};
+		};
+	};
+
+	ete6 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu6>;
+
+		out-ports {
+			port {
+				ete6_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete6>;
+				};
+			};
+		};
+	};
+
+	ete7 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu7>;
+
+		out-ports {
+			port {
+				ete7_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete7>;
+				};
+			};
+		};
+	};
+
  	funnel-ete {
  		compatible = "arm,coresight-static-funnel";

  		in-ports {
-			port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
  				funnel_ete_in_ete0: endpoint {
  					remote-endpoint = <&ete0_out_funnel_ete>;
  				};
  			};
+
+			port@1 {
+				reg = <1>;
+				funnel_ete_in_ete1: endpoint {
+					remote-endpoint = <&ete1_out_funnel_ete>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				funnel_ete_in_ete2: endpoint {
+					remote-endpoint = <&ete2_out_funnel_ete>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				funnel_ete_in_ete3: endpoint {
+					remote-endpoint = <&ete3_out_funnel_ete>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+				funnel_ete_in_ete4: endpoint {
+					remote-endpoint = <&ete4_out_funnel_ete>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				funnel_ete_in_ete5: endpoint {
+					remote-endpoint = <&ete5_out_funnel_ete>;
+				};
+			};
+
+			port@6 {
+				reg = <6>;
+				funnel_ete_in_ete6: endpoint {
+					remote-endpoint = <&ete6_out_funnel_ete>;
+				};
+			};
+
+			port@7 {
+				reg = <7>;
+				funnel_ete_in_ete7: endpoint {
+					remote-endpoint = <&ete7_out_funnel_ete>;
+				};
+			};
  		};
=============><===========================================================


>>> +
>>> +    funnel-ete {
>>> +        compatible = "arm,coresight-static-funnel";
>>> +
>>> +        in-ports {
>>> +            port {
>>> +                funnel_ete_in_ete0: endpoint {
>>> +                    remote-endpoint = <&ete0_out_funnel_ete>;
>>> +                };
>>> +            };
>>> +        };
>>> +
>>> +        out-ports {
>>> +            port {
>>> +                funnel_ete_out_funnel_apss: endpoint {
>>> +                    remote-endpoint = <&funnel_apss_in_funnel_ete>;
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>> +
>>>        firmware {
>>>            scm: scm {
>>>                compatible = "qcom,scm-sm8650", "qcom,scm";
>>> @@ -4854,6 +4888,138 @@ data-pins {
>>>                };
>>>            };
>>>    +        funnel@10042000 {
>>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>>> +
>>> +            reg = <0x0 0x10042000 0x0 0x1000>;
>>> +
>>> +            clocks = <&aoss_qmp>;
>>> +            clock-names = "apb_pclk";
>>> +
>>> +            in-ports {
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                port@4 {
>>> +                    reg = <4>;
>>> +
>>> +                    funnel_in1_in_funnel_apss: endpoint {
>>> +                        remote-endpoint = <&funnel_apss_out_funnel_in1>;
>>> +                    };
>>> +                };
>>> +            };
>>> +
>>> +            out-ports {
>>> +                port {
>>> +                    funnel_in1_out_funnel_qdss: endpoint {
>>> +                        remote-endpoint = <&funnel_qdss_in_funnel_in1>;
>>> +                    };
>>> +                };
>>> +            };
>>> +        };
>>> +
>>> +        funnel@10045000 {
>>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>>> +
>>> +            reg = <0x0 0x10045000 0x0 0x1000>;
>>> +
>>> +            clocks = <&aoss_qmp>;
>>> +            clock-names = "apb_pclk";
>>> +
>>> +            in-ports {
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                port@1 {
>>> +                    reg = <1>;
>>> +
>>> +                    funnel_qdss_in_funnel_in1: endpoint {
>>> +                        remote-endpoint = <&funnel_in1_out_funnel_qdss>;
>>> +                    };
>>> +                };
>>> +            };
>>> +
>>> +            out-ports {
>>> +                port {
>>> +                    funnel_qdss_out_funnel_aoss: endpoint {
>>> +                        remote-endpoint = <&funnel_aoss_in_funnel_qdss>;
>>> +                    };
>>> +                };
>>> +            };
>>> +        };
>>> +
>>> +        funnel@10b04000 {
>>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>>> +
>>> +            reg = <0x0 0x10b04000 0x0 0x1000>;
>>> +
>>> +            clocks = <&aoss_qmp>;
>>> +            clock-names = "apb_pclk";
>>> +
>>> +            in-ports {
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                port@7 {
>>> +                    reg = <7>;
>>> +
>>> +                    funnel_aoss_in_funnel_qdss: endpoint {
>>> +                        remote-endpoint = <&funnel_qdss_out_funnel_aoss>;
>>> +                    };
>>> +                };
>>> +            };
>>> +
>>> +            out-ports {
>>> +                port {
>>> +                    funnel_aoss_out_tmc_etf: endpoint {
>>> +                        remote-endpoint = <&tmc_etf_in_funnel_aoss>;
>>> +                    };
>>> +                };
>>> +            };
>>> +        };
>>> +
>>> +        tmc@10b05000 {
>>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>>> +
>>> +            reg = <0x0 0x10b05000 0x0 0x1000>;
>>> +
>>> +            clocks = <&aoss_qmp>;
>>> +            clock-names = "apb_pclk";
>>> +
>>> +            in-ports {
>>> +                port {
>>> +                    tmc_etf_in_funnel_aoss: endpoint {
>>> +                        remote-endpoint = <&funnel_aoss_out_tmc_etf>;
>>> +                    };
>>> +                };
>>> +            };
>>> +        };
>>> +
>>> +        funnel@13810000 {
>>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>>> +
>>> +            reg = <0x0 0x13810000 0x0 0x1000>;
>>> +
>>> +            clocks = <&aoss_qmp>;
>>> +            clock-names = "apb_pclk";
>>> +
>>> +            in-ports {
>>> +                port {
>>> +                    funnel_apss_in_funnel_ete: endpoint {
>>> +                        remote-endpoint = <&funnel_ete_out_funnel_apss>;
>>> +                    };
>>> +                };
>>> +            };
>>> +
>>> +            out-ports {
>>> +                port {
>>> +                    funnel_apss_out_funnel_in1: endpoint {
>>> +                        remote-endpoint = <&funnel_in1_in_funnel_apss>;
>>> +                    };
>>> +                };
>>> +            };
>>> +        };
>>> +
>>>            apps_smmu: iommu@15000000 {
>>>                compatible = "qcom,sm8650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>>>                reg = <0 0x15000000 0 0x100000>;
>>>
>>> ---
>>> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
>>> change-id: 20241209-sm8650-cs-dt-ad649dcfa5e8
>>>
>>> Best regards,
>>
> 


