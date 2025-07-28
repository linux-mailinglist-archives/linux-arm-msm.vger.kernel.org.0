Return-Path: <linux-arm-msm+bounces-66925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 935F0B140C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 18:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8316C540B38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00C4274B4D;
	Mon, 28 Jul 2025 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aA2vj60T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74964273D96
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753721763; cv=none; b=FHRZY23SJ0VlSD+axD+JJBhoeqGsPmvWj01A0/HMQUXtBZ4uDn0CPKbZBg/1DndXA9mCgBF9RuA2fk4+zEsNS6ZXj7Pz9Zeu36cVJR9VIX4R7US49WMQ0BKDMGNO+2xBWmH61H7ixHliovkmJKKAh3p5+vuvt3+Jt7UxVxaSvv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753721763; c=relaxed/simple;
	bh=IWsGqj4X/57So5/KOCkog10/14qVQ42Z3he9db1V0CM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hxeyK4gnpOKLU7bLw1TiiYc5VXaqWPkzOhXjWLG/yBrNkbNK/blkVyTpkalS2MsOvPCU+C5ILuuRpXXy/UBjWQcMLJyfOw74YCjoo4IysTkvtEd7y1XyNVd0i0SsrG41DIG3jCm4Zhzihtwqdul0KfaUjrkCJf3i8qAK+k+0ASo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aA2vj60T; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so45285445e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753721760; x=1754326560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAxb14cobKpHubh6WgkRHXv7TaPrn2iBxtX5EmmWVHA=;
        b=aA2vj60TiBy0IuGtW68+02dvm3V1jGqje2CLUerYKOmAFV5lk6DK+5JCoexE6i3X3k
         Mgo/2phz6oFCDn1fS6K5/q6QszTJ6fJvPxmCJ3IRIoCXhtfQk5+9Nx1Fo8nlCB08MSV9
         P70VgTIPJBFRGuh1XuVj29rineCjHeSLKLGXoyERJ3lugBHd737eu5ZBSdqfrsjMadRz
         OnRLW5XzG9vqzrQxHIAtRoRNT5aqso9kOMaC7pq8lVO1u7gb2RfTOZEjE9xtLYcbH965
         m+DGJzLcUMTeD5itNaajilew3qm6B3Iwu5OnCLxL+hGfSpJvkcK/DW34u5KkcY/x2lRB
         kTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753721760; x=1754326560;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TAxb14cobKpHubh6WgkRHXv7TaPrn2iBxtX5EmmWVHA=;
        b=oO2vrLULavGH/9lsA2ydZUQHU77wxjd79YqxrgB/2IGLxtdFsnwfS+WW6JudAMO1h2
         EkD5G8oAdSvqZObDwfFYLYWR8X1KHyBVrJHMfDfToi14DcCMaXXyU5q0vc3Z7ClxwSTq
         lXy/pE9QMp1qjKrnv4Z2ST0vkKqGVaPXeQ319513kru5rKKmjX7y2h6UAo1JdaNCE13e
         q7AWgI2k2FJvbHyz4nYu2GRpaNh/UZEl97e/teP03WILGiR9hGCp0XU7mX9Jpi8AQSFh
         kGLrwQJanHRL60yPtQnN/EC27x8Vlq3tcVyt5GbbBMmbOIxZX3yccrsIyGjp2TuUYArj
         wePg==
X-Forwarded-Encrypted: i=1; AJvYcCVJZIfkxFa5gXpv6Ih5vcmFzKQ+QosXlQfJhFbHe6U81NojEHbbvh61+076LO4V2WYojclhLa9s99WBRyJr@vger.kernel.org
X-Gm-Message-State: AOJu0YxnEH07l1w5Rfr5lhUKAFcx7noNmkl8rMrvq7G6b1yWqNdtb8ya
	LMgegl+O8iLt6HCnIDm/ccGVYwOG7XqmWgsHxKPsn4L/1BHtA4AdFcC7j4qc3L5QsGw=
X-Gm-Gg: ASbGncswasXcX13IADjXsVdpjA9mQWxUErfNO3dJ7snbJGI3LqTmoKlahazR6ojC9yA
	AcvCUwZsD7jbhO8KT8bmiCT/H3VCahTWNuTZ1cGsOUcjqhGFNeCdO22zsa8+D6eD+0Qw3Kej55f
	3+YYbBstV4TaE+7v81ydr61mYpKzo4tsFZGF8xEvdp80ikyUG+SDr4Lk6Et0Vj/XnFhMtRFCE1W
	PFQvXnp01n4D5Q1V9i4E/haMUaKv4Xy9cL1nPBggZ5MJ3MkPIxiDdeShiflnERSOboXRoh/tCFa
	cElVdps1+0CTv16KvMj93B+kcMeFF0E/vmZLIHh6zKvgnsDnQygvakEhkuUKv+hWyQicDDwhM1Q
	VFS4Enea12QaKYmpE/1DJnRT0NWkUTIn89CzzpyOu/f178VbmJ0gXvkgSwst2w6oeY1dAhAa4aW
	8=
X-Google-Smtp-Source: AGHT+IFv/mCKWlYRYe8nNdhN89iYbatzxBXqKrypW2/czFDeKXBJ+e1kssS72dYc1FY0iwFYXrIwAQ==
X-Received: by 2002:a05:600c:1e85:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-45876315613mr89213245e9.12.1753721759591;
        Mon, 28 Jul 2025 09:55:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9019:46ec:c6f1:c165? ([2a01:e0a:3d9:2080:9019:46ec:c6f1:c165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705e39b1sm157399365e9.34.2025.07.28.09.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 09:55:59 -0700 (PDT)
Message-ID: <7192f729-8267-4beb-976a-97b2e51c07f0@linaro.org>
Date: Mon, 28 Jul 2025 18:55:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] scsi: ufs: core: move some irq handling back to
 hardirq (with time limit)
To: Bart Van Assche <bvanassche@acm.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>,
 Manivannan Sadhasivam <mani@kernel.org>, kernel-team@android.com,
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250725-ufshcd-hardirq-v2-0-884c11e0b0df@linaro.org>
 <20250725-ufshcd-hardirq-v2-2-884c11e0b0df@linaro.org>
 <a008c613-58d6-4368-ae2f-55db4ac82a02@linaro.org>
 <76af97e49cb7f36c8dc6edc62c84e72d6bb4669c.camel@linaro.org>
 <c385f1c4-f27b-4dc7-b4a2-d35a9fc77a91@acm.org>
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
In-Reply-To: <c385f1c4-f27b-4dc7-b4a2-d35a9fc77a91@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 28/07/2025 17:19, Bart Van Assche wrote:
> On 7/28/25 7:49 AM, André Draszik wrote:
>> Btw, my complete command was (should probably have added that
>> to the commit message in the first place):
>>
>> for rw in read write ; do
>>      echo "rw: ${rw}"
>>      for jobs in 1 8 ; do
>>          echo "jobs: ${jobs}"
>>          for it in $(seq 1 5) ; do
>>              fio --name=rand${rw} --rw=rand${rw} \
>>                  --ioengine=libaio --direct=1 \
>>                  --bs=4k --numjobs=${jobs} --size=32m \
>>                  --runtime=30 --time_based --end_fsync=1 \
>>                  --group_reporting --filename=/foo \
>>              | grep -E '(iops|sys=|READ:|WRITE:)'
>>              sleep 5
>>          done
>>      done
>> done
> 
> Please run performance tests in recovery mode against a block
> device (/dev/block/sd...) instead of running performance tests on
> top of a filesystem. One possible approach for retrieving the block
> device name is as follows:
> 
> adb shell readlink /dev/block/by-name/userdata
> 
> There may be other approaches for retrieving the name of the block
> device associated with /data. Additionally, tuning for maximum
> performance is useful because it eliminates impact from the process
> scheduler on block device performance measurement. An extract from a
> scrip that I use myself to measure block device performance on Pixel
> devices is available below.

Of course, I did all that and ran on the SM8650 QRD & HDK boards, one has
an UFS 3.1 device and the other an UFS 4.0 device.

Here's the raw data:

Board: sm8650-qrd
read / 1 job
                     v6.15               v6.16                   v6.16 + this commit
min IOPS            3,996.00            5,921.60                           3,424.80
max IOPS            4,772.80            6,491.20                           4,541.20
avg IOPS            4,526.25            6,295.31                           4,320.58
cpu % usr               4.62                2.96                               4.50
cpu % sys              21.45               17.88                              21.62
bw MB/s                18.54               25.78                              17.64

read / 8 job
                     v6.15               v6.16                   v6.16 + this commit
min IOPS           51,867.60           51,575.40                          45,257.00
max IOPS           67,513.60           64,456.40                          56,336.00
avg IOPS           64,314.80           62,136.76                          52,505.72
cpu % usr               3.98                3.72                               3.52
cpu % sys              16.70               17.16                              18.74
bw MB/s               263.60              254.40                             215.00

write / 1 job
                     v6.15               v6.16                   v6.16 + this commit
min IOPS            5,654.80            8,060.00                           5,730.80
max IOPS            6,720.40            8,852.00                           6,981.20
avg IOPS            6,576.91            8,579.81                           6,726.51
cpu % usr               7.48                3.79                               8.49
cpu % sys              41.09               23.27                              34.86
bw MB/s                26.96               35.16                              27.52

write / 8 job
                     v6.15               v6.16                   v6.16 + this commit
min IOPS           84,687.80           95,043.40                          74,799.60
max IOPS          107,620.80          113,572.00                          96,377.20
avg IOPS           97,910.86          105,927.38                          87,239.07
cpu % usr               5.43                4.38                               3.72
cpu % sys              21.73               20.29                              30.97
bw MB/s               400.80              433.80                             357.40

Board: sm8650-hdk
read / 1 job
                     v6.15               v6.16                   v6.16 + this commit
min IOPS            4,867.20            5,596.80                           4,242.80
max IOPS            5,211.60            5,970.00                           4,548.80
avg IOPS            5,126.12            5,847.93                           4,370.14
cpu % usr               3.83                2.81                               2.62
cpu % sys              18.29               13.44                              16.89
bw MB/s                20.98               17.88                              23.96

read / 8 job
                     v6.15               v6.16                   v6.16 + this commit
min IOPS           47,583.80           46,831.60                          47,671.20
max IOPS           58,913.20           59,442.80                          56,282.80
avg IOPS           53,609.04           44,396.88                          53,621.46
cpu % usr               3.57                3.06                               3.11
cpu % sys              15.23               19.31                              15.90
bw MB/s               219.40              219.60                             210.80

write / 1 job
                     v6.15               v6.16                   v6.16 + this commit
min IOPS            6,529.42            8,367.20                           6,492.80
max IOPS            7,856.92            9,244.40                           7,184.80
avg IOPS            7,676.21            8,991.67                           6,904.67
cpu % usr              10.17                7.98                               3.68
cpu % sys              37.55               34.41                              23.07
bw MB/s                31.44               28.28                              36.84

write / 8 job
                     v6.15               v6.16                   v6.16 + this commit
min IOPS           86,304.60           94,288.80                          78,433.60
max IOPS          105,670.80          110,373.60                          96,330.80
avg IOPS           97,418.81          103,789.76                          88,468.27
cpu % usr               4.98                3.27                               3.67
cpu % sys              21.45               30.85                              20.08
bw MB/s               399.00              362.40                             425.00

Assisted analysis gives:

IOPS (Input/Output Operations Per Second):
The v6.16 kernel shows a slight increase in average IOPS compared to v6.15 (43245.69 vs. 42144.88).
The v6.16+fix kernel significantly reduces average IOPS, dropping to 36946.17.

Bandwidth (MB/s):
The v6.16 kernel shows an increase in average bandwidth compared to v6.15 (180.72 MB/s vs. 172.59 MB/s).
The v6.16 with this commit significantly reduces average bandwidth, dropping to 151.32 MB/s.

Detailed Analysis:
Impact of v6.16 Kernel:
The v6.16 kernel introduces a minor improvement in IO performance compared to v6.15.
Both average IOPS and average bandwidth saw a small increase. This suggests that the v6.16
kernel might have introduced some optimizations that slightly improved overall IO performance.

Impact of the Fix:
The potential introduced appears to have a negative impact on both IOPS and bandwidth.
Both metrics show a substantial decrease compared to both v6.15 and v6.16.
This indicates that the fix might be detrimental to IO performance.

The threaded IRQ change did increase IOPS and Bandwidth, and stopped starving interrupts.
This change gives worse numbers than before the threaded IRQ.

Neil

> 
> Best regards,
> 
> Bart.
> 
> 
> optimize() {
>      local clkgate_enable c d devfreq disable_cpuidle governor nomerges iostats
>      local target_freq ufs_irq_path
> 
>      if [ "$1" = performance ]; then
>      clkgate_enable=0
>      devfreq=max
>      disable_cpuidle=1
>      governor=performance
>      # Enable I/O statistics because the performance impact is low and
>      # because fio reports the I/O statistics.
>      iostats=1
>      # Disable merging to make tests follow the fio arguments.
>      nomerges=2
>      target_freq=cpuinfo_max_freq
>      persist_logs=false
>      else
>      clkgate_enable=1
>      devfreq=min
>      disable_cpuidle=0
>      governor=sched_pixel
>      iostats=1
>      nomerges=0
>      target_freq=cpuinfo_min_freq
>      persist_logs=true
>      fi
> 
>      for c in $(adb shell "echo /sys/devices/system/cpu/cpu[0-9]*"); do
>      for d in $(adb shell "echo $c/cpuidle/state[1-9]*"); do
>          adb shell "if [ -e $d ]; then echo $disable_cpuidle > $d/disable; fi"
>      done
>      adb shell "cat $c/cpufreq/cpuinfo_max_freq > $c/cpufreq/scaling_max_freq;
>                     cat $c/cpufreq/${target_freq} > $c/cpufreq/scaling_min_freq;
>                     echo ${governor} > $c/cpufreq/scaling_governor; true" \
>              2>/dev/null
>      done
> 
>      if [ "$(adb shell grep -c ufshcd /proc/interrupts)" = 1 ]; then
>      # No MCQ or MCQ disabled. Make the fastest CPU core process UFS
>      # interrupts.
>      # shellcheck disable=SC2016
>      ufs_irq_path=$(adb shell 'a=$(echo /proc/irq/*/ufshcd); echo ${a%/ufshcd}')
>      adb shell "echo ${fastest_cpucore} > ${ufs_irq_path}/smp_affinity_list; true"
>      else
>      # MCQ is enabled. Distribute the completion interrupts over the
>      # available CPU cores.
>      local i=0
>      local irqs
>      irqs=$(adb shell "sed -n 's/:.*GIC.*ufshcd.*//p' /proc/interrupts")
>      for irq in $irqs; do
>          adb shell "echo $i > /proc/irq/$irq/smp_affinity_list; true"
>          i=$((i+1))
>      done
>      fi
> 
>      for d in $(adb shell echo /sys/class/devfreq/*); do
>      case "$d" in
>          *gpu0)
>          continue
>          ;;
>      esac
>      local min_freq
>      min_freq=$(adb shell "cat $d/available_frequencies |
>          tr ' ' '\n' |
>          sort -n |
>          case $devfreq in
>              min) head -n1;;
>              max) tail -n1;;
>          esac")
>      adb shell "echo $min_freq > $d/min_freq"
>      # shellcheck disable=SC2086
>      if [ "$devfreq" = "max" ]; then
>          echo "$(basename $d)/min_freq: $(adb shell cat $d/min_freq) <> $min_freq"
>      fi
>      done
> 
>      for d in $(adb shell echo /sys/devices/platform/*.ufs); do
>      adb shell "echo $clkgate_enable > $d/clkgate_enable"
>      done
> 
>      adb shell setprop logd.logpersistd.enable ${persist_logs}
> 
>      adb shell "for b in /sys/class/block/{sd[a-z],dm*}; do
>              if [ -e \$b ]; then
>              [ -e \$b/queue/iostats     ] && echo ${iostats}   >\$b/queue/iostats;
>              [ -e \$b/queue/nomerges    ] && echo ${nomerges}  >\$b/queue/nomerges;
>              [ -e \$b/queue/rq_affinity ] && echo 2            >\$b/queue/rq_affinity;
>              [ -e \$b/queue/scheduler   ] && echo ${iosched}   >\$b/queue/scheduler;
>              fi
>          done; true"
> 
>      adb shell "grep -q '^[^[:blank:]]* /sys/kernel/debug' /proc/mounts || mount -t debugfs none /sys/kernel/debug"
> }
> 




